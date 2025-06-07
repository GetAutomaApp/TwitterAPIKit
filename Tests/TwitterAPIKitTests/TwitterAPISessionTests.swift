// TwitterAPISessionTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

private class GetTwitterReqeust: TwitterAPIRequest {
    var method: HTTPMethod { .get }
    var path: String { "/get.json" }
    var parameters: [String: Any] {
        ["hoge": "😀"] // = %F0%9F%98%80
    }

}

private class PostTwitterReqeust: TwitterAPIRequest {
    var method: HTTPMethod { .post }
    var path: String { "/post.json" }
    var parameters: [String: Any] {
        ["hoge": "😀"] // = %F0%9F%98%80
    }

}

private class EmptyRequest: TwitterAPIRequest {
    var method: HTTPMethod { .get }
    var path: String { "/empty.json" }
    var parameters: [String: Any] {
        [:]
    }

}

internal class TwitterAPISessionTests: XCTestCase {
    private let environment: TwitterAPIEnvironment = {
        guard let twitterURL = URL(string: "https://twitter.example.com"),
              let apiURL = URL(string: "https://api.example.com"),
              let uploadURL = URL(string: "https://upload.xample.com")
        else {
            fatalError("Invalid test URLs")
        }
        return TwitterAPIEnvironment(
            twitterURL: twitterURL,
            apiURL: apiURL,
            uploadURL: uploadURL
        )
    }()

    private lazy var session: TwitterAPISession = {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        return TwitterAPISession(
            auth: .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config,
            environment: environment
        )
    }()

    override public func tearDownWithError() throws {
        MockURLProtocol.cleanup()
    }

    public func testGET() throws {
        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.url?.absoluteString, "https://api.example.com/get.json?hoge=%F0%9F%98%80")
            XCTAssertNil(request.httpBody)
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testEmpty() throws {
        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.url?.absoluteString, "https://api.example.com/empty.json")
            XCTAssertNil(request.httpBody)
        }

        let exp = expectation(description: "")
        session.send(EmptyRequest()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    // swiftlint:disable:next function_body_length
    public func testStream() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let session = TwitterAPISession(
            auth: .bearer("bearer_token"),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw URLError(.badURL)
            }

            let data = Data("aaaa\r\nbbbb\r\n".utf8)
            guard let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil
            ) else {
                throw URLError(.badServerResponse)
            }

            return (response, data)
        }

        MockURLProtocol.requestAssert = { request in
            print(request)
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 4
        session.send(streamRequest: GetTwitterReqeust())
            .streamResponse(queue: .global(qos: .default)) { _ in
                exp.fulfill()
            }
            .streamResponse { _ in
                XCTAssertTrue(Thread.isMainThread)
                exp.fulfill()
            }
        wait(for: [exp], timeout: 10)
    }

    // MARK: - Auth

    public func testBasicAuth() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let session = TwitterAPISession(
            auth: .basic(apiKey: "api_key", apiSecretKey: "api_secret_key"),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Basic YXBpX2tleTphcGlfc2VjcmV0X2tleQ==")
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testBearerAuth() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let session = TwitterAPISession(
            auth: .bearer("bearer_token"),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Bearer bearer_token")
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testNoneAuth() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let session = TwitterAPISession(
            auth: .none,
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertNil(request.allHTTPHeaderFields?["Authorization"])
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testOAuth10aAuth() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = TwitterAPISession(
            auth: .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertNotNil(request.allHTTPHeaderFields?["Authorization"])
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testOAuth20() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = TwitterAPISession(
            auth: .oauth20(
                .init(
                    clientID: "",
                    scope: [],
                    tokenType: "",
                    expiresIn: 0,
                    accessToken: "<access_token>",
                    refreshToken: ""
                )
            ),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Bearer <access_token>")
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testRequestOAuth20WithPKCEConfidentialClient() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = TwitterAPISession(
            auth: .requestOAuth20WithPKCE(.confidentialClient(clientID: "client_id", clientSecret: "client_secret")),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Basic Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=")
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

    public func testRequestOAuth20WithPKCEPublicClient() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = TwitterAPISession(
            auth: .requestOAuth20WithPKCE(.publicClient),
            configuration: config,
            environment: environment
        )

        MockURLProtocol.requestAssert = { request in
            XCTAssertNil(request.allHTTPHeaderFields?["Authorization"])
        }

        let exp = expectation(description: "")
        session.send(GetTwitterReqeust()).responseData(queue: .main) { _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }

}

public extension Data {
    /// Initialize a Data object by reading from an InputStream.
    /// - Parameter input: The InputStream to read from.
    /// - Throws: An error if the InputStream is nil or an error occurs while reading.
    init(reading input: InputStream) throws {
        self.init()
        input.open()
        defer {
            input.close()
        }

        let bufferSize = 1_024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
        defer {
            buffer.deallocate()
        }
        while input.hasBytesAvailable {
            let read = input.read(buffer, maxLength: bufferSize)
            if read < 0 {
                // Stream error occured
                throw input.streamError ?? URLError(.unknown)
            } else if read == 0 {
                // EOF
                break
            }
            append(buffer, count: read)
        }
    }
}
