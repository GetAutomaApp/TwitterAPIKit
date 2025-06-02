// UploadMediaUtilTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

import TwitterAPIKit
import XCTest

// swiftlint:disable force_unwrapping closure_body_length function_body_length type_body_length file_length
internal class UploadMediaUtilTests: XCTestCase {
    // Helper function to safely serialize JSON
    private func serializeJSON(_ object: [String: Any]) throws -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: object, options: [])
        } catch {
            XCTFail("Failed to serialize JSON: \(error)")
            throw error
        }
    }

    override public func tearDownWithError() throws {
        MockURLProtocol.cleanup()
    }

    public func testWithProcessing() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { [weak self] request in
            guard let self else {
                throw URLError(.unknown)
            }

            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "expires_after_secs": 1_000,
                ])
            case 1: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 2: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 3: // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=FINALIZE"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "size": 10,
                    "expires_after_secs": 200,
                    "processingInfo": [
                        "state": "pending",
                        "check_after_secs": 0,
                    ],
                ])
            case 4:
                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                if let url = request.url, let query = url.query {
                    XCTAssertTrue(query.contains("command=STATUS"))
                } else {
                    XCTFail("URL or query is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "processing_info": [
                        "state": "in_progress",
                        "progress_percent": 99,
                        "check_after_secs": 0,
                    ],
                ])
            case 5:
                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                if let url = request.url, let query = url.query {
                    XCTAssertTrue(query.contains("command=STATUS"))
                } else {
                    XCTFail("URL or query is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "video": [
                        "video_type": "video/mp4",
                    ],
                    "processing_info": [
                        "state": "succeeded",
                        "progress_percent": 100,
                    ],
                ])
            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in

            XCTAssertFalse(response.isError)
            XCTAssertEqual(response.success, "123")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testInitError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { request in
            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            let data = Data("{}".utf8)
            var statusCode = 200
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }
                statusCode = 404

            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: statusCode,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in

            XCTAssertTrue(response.isError)

            if case .responseFailed(reason: .unacceptableStatusCode(statusCode: 404, error: _, rateLimit: _)) = response
                .error
            {
            } else {
                XCTFail(response.prettyString)
            }

            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testAppendError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { [weak self] request in
            guard let self else {
                throw URLError(.unknown)
            }

            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            var statusCode = 200
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "expires_after_secs": 1_000,
                ])
            case 1: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
                statusCode = 400
            case 2: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
                statusCode = 200
            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: statusCode,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in

            XCTAssertTrue(response.isError)

            if case .responseFailed(reason: .unacceptableStatusCode(statusCode: 400, error: _, rateLimit: _)) = response
                .error
            {
            } else {
                XCTFail(response.prettyString)
            }

            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testFinalizeError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var statusCode = 200
        var requestCount = 0
        MockURLProtocol.requestHandler = { [weak self] request in
            guard let self else {
                throw URLError(.unknown)
            }

            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "expires_after_secs": 1_000,
                ])
            case 1: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 2: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 3: // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=FINALIZE"))
                } else {
                    XCTFail("Request body string is nil")
                }
                statusCode = 500
            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: statusCode,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in

            XCTAssertTrue(response.isError)

            if case .responseFailed(reason: .unacceptableStatusCode(statusCode: 500, error: _, rateLimit: _)) = response
                .error
            {
            } else {
                XCTFail(response.prettyString)
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testWithProcessingError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { [weak self] request in
            guard let self else {
                throw URLError(.unknown)
            }

            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "expires_after_secs": 1_000,
                ])
            case 1: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 2: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }
            case 3: // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=FINALIZE"))
                } else {
                    XCTFail("Request body string is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "size": 10,
                    "expires_after_secs": 200,
                    "processingInfo": [
                        "state": "pending",
                        "check_after_secs": 0,
                    ],
                ])
            case 4:
                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                if let url = request.url, let query = url.query {
                    XCTAssertTrue(query.contains("command=STATUS"))
                } else {
                    XCTFail("URL or query is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "processing_info": [
                        "state": "in_progress",
                        "progress_percent": 99,
                        "check_after_secs": 0,
                    ],
                ])
            case 5:
                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                if let url = request.url, let query = url.query {
                    XCTAssertTrue(query.contains("command=STATUS"))
                } else {
                    XCTFail("URL or query is nil")
                }

                data = try serializeJSON([
                    "media_id_string": "123",
                    "processing_info": [
                        "state": "failed",
                        "error": [
                            "message": "Invalid media",
                            "code": 1,
                        ],
                    ],
                ])
            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in
            XCTAssertTrue(response.isError)
            guard let uploadFailed = response.error?.isUploadMediaFailed else {
                XCTFail("response.error is nil")
                return
            }
            XCTAssertTrue(uploadFailed)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testWithoutProcessing() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIClient(
            .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { request in
            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0: // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=INIT"))
                } else {
                    XCTFail("Request body string is nil")
                }

                do {
                    data = try JSONSerialization.data(
                        withJSONObject: [
                            "media_id_string": "123",
                            "expires_after_secs": 1_000,
                        ],
                        options: []
                    )
                } catch {
                    XCTFail("Failed to serialize JSON: \(error)")
                }

            case 1: // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("\r\nAPPEND\r\n"))
                } else {
                    XCTFail("Request body string is nil")
                }

            case 2: // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                if let bodyString = requestBodyString {
                    XCTAssertTrue(bodyString.contains("command=FINALIZE"))
                } else {
                    XCTFail("Request body string is nil")
                }

                do {
                    data = try JSONSerialization.data(
                        withJSONObject: [
                            "media_id_string": "123",
                            "size": 10,
                            "expires_after_secs": 200,
                        ],
                        options: []
                    )
                } catch {
                    XCTFail("Failed to serialize JSON: \(error)")
                }

            default:
                XCTFail("Invalid Response")
            }

            if let url = request.url {
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: "2.0",
                        headerFields: [:]
                    )),
                    data
                )
            } else {
                XCTFail("Request URL is nil")
                return (
                    convertOptionalHttpUrlResponseToHttpUrlResponse(
                        HTTPURLResponse(
                            url: URL(string: "https://example.com")!,
                            statusCode: 200,
                            httpVersion: "2.0",
                            headerFields: [:]
                        )
                    ), data)
            }
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f")) { response in
            XCTAssertFalse(response.isError)
            XCTAssertEqual(response.success, "123")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    deinit {
        // De-init Logic Here
    }
}
// swiftlint:enable force_unwrapping closure_body_length function_body_length type_body_length file_length
