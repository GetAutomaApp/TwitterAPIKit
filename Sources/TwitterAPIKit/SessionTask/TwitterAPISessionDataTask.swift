import Foundation

public protocol TwitterAPISessionDataTask: TwitterAPISessionTask {
    @discardableResult
    func responseData(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self

    @discardableResult
    func responseData(
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self
}

// MARK: - internal

extension TwitterAPISessionDataTask {
    func specialized<NewSuccess: Sendable>(
        _ transform: @Sendable @escaping (Data) throws -> NewSuccess
    )
        -> TwitterAPISessionSpecializedTask<NewSuccess>
    {
        return TwitterAPISessionSpecializedTask(task: self, transform: transform)
    }
}
