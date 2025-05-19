// CombinationsSequence.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

/// A collection wrapper that generates combinations of a base collection.
public struct CombinationsSequence<Base: Collection> {
    /// The collection to iterate over for combinations.
    @usableFromInline internal let base: Base

    @usableFromInline internal let baseCount: Int

    /// The range of accepted sizes of combinations.
    ///
    /// - Note: This may be `nil` if the attempted range entirely exceeds the
    /// upper bounds of the size of the `base` collection.
    @usableFromInline internal let combinationRange: Range<Int>?

    /// Initializes a `CombinationsSequence` for all combinations of `base` of
    /// size `k`.
    ///
    /// - Parameters:
    ///   - base: The collection to iterate over for combinations.
    ///   - size: The expected size of each combination.
    @inlinable
    internal init(_ base: Base, size: Int) {
        self.init(base, kRange: size ... size)
    }

    /// Initializes a `CombinationsSequence` for all combinations of `base` of
    /// sizes within a given range.
    ///
    /// - Parameters:
    ///   - base: The collection to iterate over for combinations.
    ///   - kRange: The range of accepted sizes of combinations.
    @inlinable
    internal init<R: RangeExpression>(
        _ base: Base, kRange: R
    ) where R.Bound == Int {
        let range = kRange.relative(to: 0 ..< .max)
        self.base = base
        let baseCount = base.count
        self.baseCount = baseCount
        let upperBound = baseCount + 1
        self.combinationRange =
            range.lowerBound < upperBound
                ? range.clamped(to: 0 ..< upperBound)
                : nil
    }

    /// The total number of combinations.
    @inlinable public var count: Int {
        guard let range = combinationRange else { return 0 }
        let total = baseCount
        if range == 0 ..< (total + 1) {
            return 1 << total
        }

        internal func binomial(total: Int, size: Int) -> Int {
            switch size {
            case total, 0: return 1
            case total...: return 0
            case (total / 2 + 1)...: return binomial(total: total, size: total - size)
            default: return total * binomial(total: total - 1, size: size - 1) / size
            }
        }

        return range
            .map {
                binomial(total: total, size: $0)
            }
            .reduce(0, +)
    }
}

extension CombinationsSequence: Sequence {
    /// The iterator for a `CombinationsSequence` instance.
    public struct Iterator: IteratorProtocol {
        @usableFromInline internal let base: Base

        /// The current range of accepted sizes of combinations.
        ///
        /// - Note: The range is contracted until empty while iterating over
        /// combinations of different sizes. When the range is empty, iteration is
        /// finished.
        @usableFromInline internal var kRange: Range<Int>

        /// Whether or not iteration is finished (`kRange` is empty)
        @inlinable internal var isFinished: Bool {
            return kRange.isEmpty
        }

        @usableFromInline internal var indexes: [Base.Index]

        @inlinable
        internal init(_ combinations: CombinationsSequence) {
            base = combinations.base
            kRange = combinations.combinationRange ?? 0 ..< 0
            indexes = Array(combinations.base.indices.prefix(kRange.lowerBound))
        }

        /// Advances the current indices to the next set of combinations. If
        /// `indexes.count == 3` and `base.count == 5`, the indices advance like
        /// this:
        ///
        ///     [0, 1, 2]
        ///     [0, 1, 3]
        ///     [0, 1, 4] *
        ///     // * `base.endIndex` reached in `indexes.last`
        ///     // Advance penultimate index and propagate that change
        ///     [0, 2, 3]
        ///     [0, 2, 4] *
        ///     [0, 3, 4] *
        ///     [1, 2, 3]
        ///     [1, 2, 4] *
        ///     [1, 3, 4] *
        ///     [2, 3, 4] *
        ///     // Can't advance without needing to go past `base.endIndex`,
        ///     // so the iteration is finished.
        @inlinable
        internal mutating func advance() {
            // Advances `kRange` by incrementing its `lowerBound` until the range is
            // empty, when iteration is finished.
            internal func advanceKRange() {
                if kRange.lowerBound < kRange.upperBound {
                    let advancedLowerBound = kRange.lowerBound + 1
                    kRange = advancedLowerBound ..< kRange.upperBound
                    indexes.removeAll(keepingCapacity: true)
                    indexes.append(contentsOf: base.indices.prefix(kRange.lowerBound))
                }
            }

            guard !indexes.isEmpty else {
                // Initial state for combinations of 0 elements is an empty array with
                // `finished == false`. Even though no indexes are involved, advancing
                // from that state means we are finished with iterating.
                advanceKRange()
                return
            }

            let lastIndex = indexes.count - 1
            base.formIndex(after: &indexes[lastIndex])
            if indexes[lastIndex] != base.endIndex { return }

            var currentIndex = lastIndex
            while indexes[lastIndex] == base.endIndex {
                currentIndex -= 1
                guard currentIndex >= 0 else {
                    // Finished iterating over combinations of this size.
                    advanceKRange()
                    return
                }

                base.formIndex(after: &indexes[currentIndex])
                for nextIndex in indexes.indices[(currentIndex + 1)...] {
                    indexes[nextIndex] = base.index(after: indexes[nextIndex - 1])
                    if indexes[nextIndex] == base.endIndex {
                        break
                    }
                }
            }
        }

        @inlinable
        public mutating func next() -> [Base.Element]? {
            guard !isFinished else { return nil }
            defer { advance() }
            return indexes.map { index in base[index] }
        }
    }

    @inlinable
    public func makeIterator() -> Iterator {
        Iterator(self)
    }
}

extension CombinationsSequence: LazySequenceProtocol
    where Base: LazySequenceProtocol {}

// ===----------------------------------------------------------------------===//
// combinations(ofCount:)
// ===----------------------------------------------------------------------===//

public extension Collection {
    /// Returns a collection of combinations of this collection's elements, with
    /// each combination having the specified number of elements.
    ///
    /// This example prints the different combinations of 1 and 2 from an array of
    /// four colors:
    ///
    ///     let colors = ["fuchsia", "cyan", "mauve", "magenta"]
    ///     for combo in colors.combinations(ofCount: 1...2) {
    ///         print(combo.joined(separator: ", "))
    ///     }
    ///     // fuchsia
    ///     // cyan
    ///     // mauve
    ///     // magenta
    ///     // fuchsia, cyan
    ///     // fuchsia, mauve
    ///     // fuchsia, magenta
    ///     // cyan, mauve
    ///     // cyan, magenta
    ///     // mauve, magenta
    ///
    /// The returned collection presents combinations in a consistent order, where
    /// the indices in each combination are in ascending lexicographical order.
    /// That is, in the example above, the combinations in order are the elements
    /// at `[0]`, `[1]`, `[2]`, `[3]`, `[0, 1]`, `[0, 2]`, `[0, 3]`, `[1, 2]`,
    /// `[1, 3]`, and finally `[2, 3]`.
    ///
    /// This example prints _all_ the combinations (including an empty array and
    /// the original collection) from an array of numbers:
    ///
    ///     let numbers = [10, 20, 30, 40]
    ///     for combo in numbers.combinations(ofCount: 0...) {
    ///         print(combo)
    ///     }
    ///     // []
    ///     // [10]
    ///     // [20]
    ///     // [30]
    ///     // [40]
    ///     // [10, 20]
    ///     // [10, 30]
    ///     // [10, 40]
    ///     // [20, 30]
    ///     // [20, 40]
    ///     // [30, 40]
    ///     // [10, 20, 30]
    ///     // [10, 20, 40]
    ///     // [10, 30, 40]
    ///     // [20, 30, 40]
    ///     // [10, 20, 30, 40]
    ///
    /// If `kRange` is `0...0`, the resulting sequence has exactly one element, an
    /// empty array. The given range is limited to `0...base.count`. If the
    /// limited range is empty, the resulting sequence has no elements.
    ///
    /// - Parameter kRange: The range of numbers of elements to include in each
    ///   combination.
    ///
    /// - Complexity: O(1) for random-access base collections. O(*n*) where *n*
    ///   is the number of elements in the base collection, since
    ///   `CombinationsSequence` accesses the `count` of the base collection.
    @inlinable
    public func combinations<R: RangeExpression>(
        ofCount range: R
    ) -> CombinationsSequence<Self> where R.Bound == Int {
        return CombinationsSequence(self, kRange: range)
    }

    /// Returns a collection of combinations of this collection's elements, with
    /// each combination having the specified number of elements.
    ///
    /// - Parameter size: The number of elements to include in each combination.
    ///
    /// - Complexity: O(1) for random-access base collections. O(*n*) where *n*
    ///   is the number of elements in the base collection, since
    ///   `CombinationsSequence` accesses the `count` of the base collection.
    @inlinable
    public func combinations(ofCount size: Int) -> CombinationsSequence<Self> {
        precondition(size >= 0, "Can't have combinations with a negative number of elements.")
        return CombinationsSequence(self, size: size)
    }
}
