import Foundation

public protocol TwitterAPISessionJSONTask: TwitterAPISessionDataTask {
    @discardableResult
    func responseObject(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<any Sendable>) -> Void
    ) -> Self

    @discardableResult
    func responseObject(
        _ block: @Sendable @escaping (TwitterAPIResponse<any Sendable>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        decoder: JSONDecoder,
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        decoder: JSONDecoder,
        _ block: @Sendable @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        _ block: @Sendable @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self
}
