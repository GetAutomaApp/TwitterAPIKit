// MockURLProtocol.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

internal func convertOptionalHttpUrlResponseToHttpUrlResponse(
    _ response: HTTPURLResponse?
) -> HTTPURLResponse {
    // swiftlint:disable:next force_unwrapping
    return response!
}

internal class MockURLProtocol: URLProtocol {
    public static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    public static var requestAssert: ((URLRequest) throws -> Void)?

    override public class func canInit(with _: URLRequest) -> Bool {
        true
    }

    override public class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    public static func cleanup() {
        requestHandler = nil
        requestAssert = nil
    }

    override public func startLoading() {
        guard let url = request.url else {
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
            return
        }

        let handler: (URLRequest) throws -> (HTTPURLResponse, Data?) = Self.requestHandler ?? { request in
            guard let requestURL = request.url else {
                throw URLError(.badURL)
            }
            return (
                convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                    url: requestURL,
                    statusCode: 200,
                    httpVersion: "2.0",
                    headerFields: nil
                )),
                Data()
            )
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
