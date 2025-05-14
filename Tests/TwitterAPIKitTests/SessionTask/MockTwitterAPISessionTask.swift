import Foundation
import TwitterAPIKit

internal class MockTwitterAPISessionTask: TwitterAPISessionTask {
    public var taskIdentifier: Int
    public var currentRequest: URLRequest?
    public var originalRequest: URLRequest?
    public var httpResponse: HTTPURLResponse?
    public var cancelled = false

    public init(
        taskIdentifier: Int,
        currentRequest: URLRequest? = nil,
        originalRequest: URLRequest? = nil,
        httpResponse: HTTPURLResponse? = nil
    ) {
        self.taskIdentifier = taskIdentifier
        self.currentRequest = currentRequest
        self.originalRequest = originalRequest
        self.httpResponse = httpResponse
    }

    public func cancel() {
        cancelled = true
    }

    deinit {
        // De-init Logic Here
    }
}

internal class MockTwitterAPISessionDataTask: MockTwitterAPISessionTask, TwitterAPISessionDataTask {
    public var data: Data

    public init(
        data: Data,
        taskIdentifier: Int,
        currentRequest: URLRequest? = nil,
        originalRequest: URLRequest? = nil,
        httpResponse: HTTPURLResponse? = nil
    ) {
        self.data = data
        super.init(
            taskIdentifier: taskIdentifier,
            currentRequest: currentRequest,
            originalRequest: originalRequest,
            httpResponse: httpResponse
        )
    }

    public func responseData(queue: DispatchQueue, _ block: @escaping (TwitterAPIResponse<Data>) -> Void) -> Self {
        queue.async { [weak self] in
            guard let self else { return }
            block(
                .init(
                    request: currentRequest,
                    response: httpResponse,
                    data: data,
                    result: .success(data),
                    rateLimit: TwitterRateLimit(header: [:])
                )
            )
        }
        return self
    }

    public func responseData(_ block: @escaping (TwitterAPIResponse<Data>) -> Void) -> Self {
        return responseData(queue: .main, block)
    }

    deinit {
        // De-init Logic Here
    }
}
