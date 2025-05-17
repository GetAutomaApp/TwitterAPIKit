// gen_init_params.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/*
 public let target: TwitterUserIdentifierV1
 public let count: Int?

 ↓

 public init(
    target: TwitterUserIdentifierV1,
    count: Int? = none
 ) {
    self.target = target
    self.count = count
 }
 */

func initializer(input: String) -> String {
    let regex = try! NSRegularExpression(pattern: #"[^ ] ([a-zA-Z]+): ([a-zA-Z\d<>\[\]]+\??)$"#)

    let pairs = input.split(separator: "\n")
        .map { line -> String in line.trimmingCharacters(in: .whitespacesAndNewlines) }
        .compactMap { line -> (name: String, type: String)? in
            guard let match = regex.firstMatch(in: line, options: [], range: .init(location: 0, length: line.count))
            else {
                return nil
            }
            guard match.numberOfRanges == 3 else {
                return nil
            }

            let firstRange = Range(match.range(at: 1), in: line)!
            let secondRange = Range(match.range(at: 2), in: line)!
            let name = String(line[firstRange])
            let type = String(line[secondRange])
            return (name: name, type: type)
        }

    let initArgs: [String] = pairs.map { (name: String, type: String) in
        if type.hasSuffix("?") {
            return "\(name): \(type) = .none"
        }
        return "\(name): \(type)"
    }

    let initBody: [String] = pairs.map { (name: String, _: String) in
        "self.\(name) = \(name)"
    }

    return """
    public init(
        \(initArgs.joined(separator: ",\n    "))
    ) {
        \(initBody.joined(separator: "\n    "))
    }
    """
}

// Thanks https://gist.github.com/dmsl1805/ad9a14b127d0409cf9621dc13d237457
extension String {
    func camelCaseToSnakeCase() -> String {
        let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
        let normalPattern = "([a-z0-9])([A-Z])"
        return processCamalCaseRegex(pattern: acronymPattern)?
            .processCamalCaseRegex(pattern: normalPattern)?.lowercased() ?? lowercased()
    }

    fileprivate func processCamalCaseRegex(pattern: String) -> String? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2")
    }
}

extension String {
    func preperForSpecialPattern() -> String {
        // "XXs" -> "XXS", ex) IDs, RTs -> IDS, RTS
        let pattern = "([A-Z]{2})(s)$"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        guard let match = regex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)),
              let range = Range(match.range, in: self)
        else { return self }
        return replacingCharacters(in: range, with: self[range].uppercased())
    }
}

extension NSRegularExpression {
    func matches(in str: String, at index: Int) -> [String] {
        return matches(in: str, options: [], range: .init(location: 0, length: str.utf16.count))
            .map { match in
                let range = Range(match.range(at: index), in: str)!
                let substring = str[range]
                return String(substring)
            }
    }
}

/*
 public let hoge: String
 public let fooBar: String?
  ↓ ↓ ↓ ↓
 p["hoge"] = hoge
 fooBar.map { p["foo_bar"] = $0 }
 */
func body(input: String) -> String {
    let primitiveTypes = [": Int", ": String", ": Bool"]

    let regex = try! NSRegularExpression(pattern: "[^ ] ([a-zA-Z\\d]*?): ")

    let params: [String] = input.split(separator: "\n")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .compactMap { line in
            let names = regex.matches(in: line, at: 1)
            guard let name = names.first else { return nil }
            let snakeCaseName = name.preperForSpecialPattern().camelCaseToSnakeCase()

            if !primitiveTypes.contains(where: { line.contains($0) }) {
                // ex: public let users: TwitterUsersIdentifier

                let optional = line.hasSuffix("?") ? "?" : ""
                return "\(name)\(optional).bind(param: &p)"
            } else if line.hasSuffix("?") {
                if line.hasSuffix("]?") {
                    // may be optional array. ex: [String]?
                    // In the case of Dictionary, it breaks.
                    // additionalOwners.map { p["additional_owners"] = $0.joined(separator: ",") }
                    return "\(name).map { p[\"\(snakeCaseName)\"] = $0.joined(separator: \",\") }"
                }

                // optional value
                return "\(name).map { p[\"\(snakeCaseName)\"] = $0 }"

            } else {
                return "p[\"\(snakeCaseName)\"] = \(name) "
            }
        }
    return """
        open var parameters: [String: Any] {
            var p = [String: Any]()
            \(params.joined(separator: "\n    "))
            return p
        }
    """
}

func exec() {
    let input = FileHandle.standardInput

    guard let input = String(bytes: input.availableData, encoding: .utf8) else {
        print("pbpaste | ./gen_init_params.swift")
        return
    }

    print(body(input: input))
    print("")
    print(initializer(input: input))
}

exec()
