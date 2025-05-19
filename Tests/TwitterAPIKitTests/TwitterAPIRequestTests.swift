// TwitterAPIRequestTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import XCTest

@testable import TwitterAPIKit

internal class TwitterAPIRequestTests: XCTestCase {
    private struct MockTwitterAPIRequest: TwitterAPIRequest {
        var method: HTTPMethod = .get
        var path: String = "/mock"
        var parameters: [String: Any]
        var baseURLType: TwitterBaseURLType = .api
        var bodyContentType: BodyContentType = .wwwFormUrlEncoded
    }

    private struct MockTwitterAPIQueryAndBodyRequest: TwitterAPIRequest {
        var method: HTTPMethod = .get
        var path: String = "/mock"
        var queryParameters: [String: Any]
        var bodyParameters: [String: Any]
        var baseURLType: TwitterBaseURLType = .api
        var bodyContentType: BodyContentType = .wwwFormUrlEncoded
    }

    private var env: TwitterAPIEnvironment

    override public init() {
        let apiUrl = URL(string: "https://api.example.com")
        let uploadUrl = URL(string: "https://upload.example.com")

        guard let apiUrl, let uploadUrl else {
            XCTFail("apiUrl / uploadUrl isn't valid")
        }

        env = .init(
            apiURL: apiUrl,
            uploadURL: uploadUrl
        )
    }

    public func testRequestURL() throws {
        XCTContext.runActivity(named: "api") { _ in
            let req = MockTwitterAPIRequest(parameters: ["key": "value"], baseURLType: .api)
            XCTAssertEqual(req.requestURL(for: env).absoluteString, "https://api.example.com/mock")
        }

        XCTContext.runActivity(named: "upload") { _ in
            let req = MockTwitterAPIRequest(parameters: ["key": "value"], baseURLType: .upload)
            XCTAssertEqual(req.requestURL(for: env).absoluteString, "https://upload.example.com/mock")
        }
    }

    public func testParameterForOAuth() throws {
        XCTContext.runActivity(named: "wwwFormUrlEncoded") { _ in
            let req = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .wwwFormUrlEncoded)
            XCTAssertEqual(req.parameterForOAuth as? [String: String], ["key": "value"])
        }

        XCTContext.runActivity(named: "json") { _ in
            let req = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .json)
            XCTAssertEqual(req.parameterForOAuth as? [String: String], [:])
        }

        XCTContext.runActivity(named: "multipartFormData") { _ in
            let req = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .multipartFormData)
            XCTAssertEqual(req.parameterForOAuth as? [String: String], [:])
        }
    }

    public func testParameterByMethods() throws {
        // 🥓 = F0 9F A5 93

        try XCTContext.runActivity(named: "GET") { _ in
            let req = MockTwitterAPIRequest(
                method: .get,
                parameters: ["key": "value,🥓"]
            )

            XCTAssertEqual(req.queryParameters as? [String: String], ["key": "value,🥓"])
            XCTAssertEqual(req.bodyParameters as? [String: String], [:])

            let urlReq = try req.buildRequest(environment: env)

            XCTAssertEqual(urlReq.httpMethod, "GET")
            XCTAssertEqual(urlReq.url?.query, "key=value%2C%F0%9F%A5%93")
            XCTAssertNil(urlReq.httpBody)
        }

        try XCTContext.runActivity(named: "POST") { _ in
            let req = MockTwitterAPIRequest(
                method: .post,
                parameters: ["key": "value,🥓"]
            )

            XCTAssertEqual(req.queryParameters as? [String: String], [:])
            XCTAssertEqual(req.bodyParameters as? [String: String], ["key": "value,🥓"])

            let urlReq = try req.buildRequest(environment: env)

            XCTAssertEqual(urlReq.httpMethod, "POST")
            XCTAssertNil(urlReq.url?.query)
            let httpBody = try XCTUnwrap(urlReq.httpBody)
            let bodyString = try XCTUnwrap(String(data: httpBody, encoding: .utf8))
            XCTAssertEqual(bodyString, "key=value%2C%F0%9F%A5%93")
        }

        try XCTContext.runActivity(named: "PUT") { _ in
            let req = MockTwitterAPIRequest(
                method: .put,
                parameters: ["key": "value,🥓"]
            )

            XCTAssertEqual(req.queryParameters as? [String: String], [:])
            XCTAssertEqual(req.bodyParameters as? [String: String], ["key": "value,🥓"])

            let urlReq = try req.buildRequest(environment: env)

            XCTAssertEqual(urlReq.httpMethod, "PUT")
            XCTAssertNil(urlReq.url?.query)
            let httpBody = try XCTUnwrap(urlReq.httpBody)
            let bodyString = try XCTUnwrap(String(data: httpBody, encoding: .utf8))
            XCTAssertEqual(bodyString, "key=value%2C%F0%9F%A5%93")
        }

        try XCTContext.runActivity(named: "DELETE") { _ in
            let req = MockTwitterAPIRequest(
                method: .delete,
                parameters: ["key": "value,🥓"]
            )

            XCTAssertEqual(req.queryParameters as? [String: String], ["key": "value,🥓"])
            XCTAssertEqual(req.bodyParameters as? [String: String], [:])

            let urlReq = try req.buildRequest(environment: env)

            XCTAssertEqual(urlReq.httpMethod, "DELETE")
            XCTAssertEqual(urlReq.url?.query, "key=value%2C%F0%9F%A5%93")
            XCTAssertNil(urlReq.httpBody)
        }
    }

    public func testURLQueryPercentEncode() throws {
        let req = MockTwitterAPIRequest(
            method: .get,
            parameters: [
                "☃": "1970-01-01T00:01:00Z",
                "key": "v a l u e",
                "キー": "値",
            ]
        )

        let urlReq = try req.buildRequest(environment: env)

        XCTAssertEqual(
            urlReq.url?.query, #"key=v%20a%20l%20u%20e&%E2%98%83=1970-01-01T00%3A01%3A00Z&%E3%82%AD%E3%83%BC=%E5%80%A4"#
        )
    }

    public func testBodyAndQueryParameter() throws {
        let req = MockTwitterAPIQueryAndBodyRequest(
            method: .post,
            queryParameters: ["key": "value,🥓"],
            bodyParameters: ["body": "あ"]
        )

        XCTAssertEqual(req.parameters as? [String: String], [:])
        XCTAssertEqual(req.queryParameters as? [String: String], ["key": "value,🥓"])
        XCTAssertEqual(req.bodyParameters as? [String: String], ["body": "あ"])

        let urlReq = try req.buildRequest(environment: env)

        XCTAssertEqual(urlReq.httpMethod, "POST")
        XCTAssertEqual(urlReq.url?.query, "key=value%2C%F0%9F%A5%93")
        let httpBody = try XCTUnwrap(urlReq.httpBody)
        let bodyString = try XCTUnwrap(String(data: httpBody, encoding: .utf8))
        XCTAssertEqual(bodyString, "body=%E3%81%82")
    }

    public func testBodyContentType() throws {
        try testWWWFormUrlEncoded()
        try testMultipartFormData()
        try testJSON()
    }

    public func testWWWFormUrlEncoded() throws {
        try XCTContext.runActivity(named: "wwwFormUrlEncoded") { _ in
            let req = try MockTwitterAPIRequest(
                method: .post,
                parameters: ["key": "value,🥓"],
                bodyContentType: .wwwFormUrlEncoded
            ).buildRequest(environment: env)

            let httpBody = try XCTUnwrap(req.httpBody)
            let body = try XCTUnwrap(String(data: httpBody, encoding: .utf8))
            XCTAssertEqual(body, "key=value%2C%F0%9F%A5%93")
        }
    }

    public func testMultipartFormData() throws {
        try XCTContext.runActivity(named: "multipartFormData") { _ in
            let req = try MockTwitterAPIRequest(
                method: .post,
                parameters: [
                    "a-value": MultipartFormDataPart.value(name: "a", value: "value"),
                    "b-data": MultipartFormDataPart.data(
                        name: "b",
                        value: Data("ab".utf8),
                        filename: "hoge.txt",
                        mimeType: "plain/text"
                    ),
                ],
                bodyContentType: .multipartFormData
            ).buildRequest(environment: env)

            guard let contentType = req.allHTTPHeaderFields?["Content-Type"] else {
                XCTFail("Content-Type header not found")
                return
            }
            XCTAssertTrue(contentType.hasPrefix("multipart/form-data; boundary=TwitterAPIKit-"))

            let boundary = contentType.replacingOccurrences(
                of: "multipart/form-data; boundary=", with: ""
            )
            
            guard let httpBody = req.httpBody,
                  let body = String(data: httpBody, encoding: .utf8) else {
                XCTFail("Failed to get HTTP body or decode as UTF-8")
                return
            }

            let expect = """
            --\(boundary)\r\n
            Content-Disposition: form-data; name="a"\r\n
            \r\n
            value\r\n
            --\(boundary)\r\n
            Content-Disposition: form-data; name="b"; filename="hoge.txt"\r\n
            Content-Type: plain/text\r\n
            \r\n
            ab\r\n
            --\(boundary)--\r\n
            """

            XCTAssertEqual(body, expect)
            try testInvalidMultipartFormData()
        }
    }

    public func testInvalidMultipartFormData() throws {
        try XCTContext.runActivity(named: "Invalid parameter") { _ in
            XCTAssertThrowsError(
                try MockTwitterAPIRequest(
                    method: .post,
                    parameters: ["key": "value,🥓"],
                    bodyContentType: .multipartFormData
                ).buildRequest(environment: env)
            ) { error in
                XCTAssertTrue(error is TwitterAPIKitError)
            }
        }
    }

    public func testJSON() throws {
        try XCTContext.runActivity(named: "json") { _ in
            let req = try MockTwitterAPIRequest(
                method: .post,
                parameters: ["key": "value,🥓"],
                bodyContentType: .json
            ).buildRequest(environment: env)

            let httpBody = try XCTUnwrap(req.httpBody)
            let body = try JSONSerialization.jsonObject(with: httpBody, options: [])
            XCTAssertEqual(body as? [String: String], ["key": "value,🥓"])

            try testInvalidJSON()
            try testInvalidJSONValue()
        }
    }

    public func testInvalidJSON() throws {
        try XCTContext.runActivity(named: "Invalid") { _ in
            XCTAssertThrowsError(
                try MockTwitterAPIRequest(
                    method: .post,
                    parameters: ["key": Data()],
                    bodyContentType: .json
                ).buildRequest(environment: env)
            ) { error in
                if
                    let error = error as? TwitterAPIKitError,
                    case .jsonSerializationFailed = error.requestFailureReason
                {
                } else {
                    XCTFail("Unknown Error")
                }
            }
        }
    }

    public func testInvalidJSONValue() throws {
        try XCTContext.runActivity(named: "Invalid value") { _ in
            // Create invalid UTF-16 string bytes
            let invalidBytes: [UInt8] = [0xD8, 0x00]
            
            guard let invalidString = String(bytes: invalidBytes, encoding: .utf16BigEndian) else {
                XCTFail("Failed to create test string")
                return
            }
            
            XCTAssertThrowsError(
                try MockTwitterAPIRequest(
                    method: .post,
                    parameters: [invalidString: invalidString],
                    bodyContentType: .json
                ).buildRequest(environment: env)
            ) { error in
                if
                    let error = error as? TwitterAPIKitError,
                    case .jsonSerializationFailed = error.requestFailureReason
                {
                } else {
                    XCTFail("Unknown Error")
                }
            }
        }
    }

    deinit {
        // De-init Logic Here
    }
}
