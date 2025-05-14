import Foundation

internal class MockURLProtocol: URLProtocol {
    public static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    public static var requestAssert: ((URLRequest) throws -> Void)?

    override public class func canInit(with _: URLRequest) -> Bool {
        return true
    }

    override public class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    public static func cleanup() {
        Self.requestHandler = nil
        Self.requestAssert = nil
    }

    override public func startLoading() {
        let handler: (URLRequest) throws -> (HTTPURLResponse, Data?)
        if let reqHandler = Self.requestHandler {
            handler = reqHandler
        } else {
            handler = { request in
                (
                    HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!, Data()
                )
            }
        }

        do {
            try Self.requestAssert?(request)

            let (response, data): (URLResponse, Data?) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

            if let data {
                client?.urlProtocol(self, didLoad: data)
            }

            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override public func stopLoading() {}

    deinit {
        // De-init Logic Here
    }
}
