// TwitterAPIRequestTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

// swiftlint:disable force_cast force_unwrapping
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

    private let env = TwitterAPIEnvironment(
        apiURL: .init(string: "https://api.example.com")!,
        uploadURL: .init(string: "https://upload.example.com")!
    )

    public func testRequestURL() throws {
        let req = MockTwitterAPIRequest(parameters: ["key": "value"], baseURLType: .api)
        XCTAssertEqual(req.requestURL(for: env).absoluteString, "https://api.example.com/mock")

        let req2 = MockTwitterAPIRequest(parameters: ["key": "value"], baseURLType: .upload)
        XCTAssertEqual(req2.requestURL(for: env).absoluteString, "https://upload.example.com/mock")
    }

    public func testParameterForOAuth() throws {
        let req = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .wwwFormUrlEncoded)
        XCTAssertEqual(req.parameterForOAuth as? [String: String], ["key": "value"])

        let req2 = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .json)
        XCTAssertEqual(req2.parameterForOAuth as? [String: String], [:])

        let req3 = MockTwitterAPIRequest(parameters: ["key": "value"], bodyContentType: .multipartFormData)
        XCTAssertEqual(req3.parameterForOAuth as? [String: String], [:])
    }

    // swiftlint:disable:next function_body_length
    public func testParameterByMethods() throws {
        // 🥓 = F0 9F A5 93

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

        let req2 = MockTwitterAPIRequest(
            method: .post,
            parameters: ["key": "value,🥓"]
        )

        XCTAssertEqual(req2.queryParameters as! [String: String], [:])
        XCTAssertEqual(req2.bodyParameters as! [String: String], ["key": "value,🥓"])

        let urlReq2 = try req2.buildRequest(environment: env)

        XCTAssertEqual(urlReq2.httpMethod, "POST")
        XCTAssertNil(urlReq2.url?.query)
        XCTAssertEqual(String(data: urlReq2.httpBody!, encoding: .utf8)!, "key=value%2C%F0%9F%A5%93")

        let req3 = MockTwitterAPIRequest(
            method: .put,
            parameters: ["key": "value,🥓"]
        )

        XCTAssertEqual(req3.queryParameters as! [String: String], [:])
        XCTAssertEqual(req3.bodyParameters as! [String: String], ["key": "value,🥓"])

        let urlReq3 = try req3.buildRequest(environment: env)

        XCTAssertEqual(urlReq3.httpMethod, "PUT")
        XCTAssertNil(urlReq3.url?.query)
        XCTAssertEqual(String(data: urlReq3.httpBody!, encoding: .utf8)!, "key=value%2C%F0%9F%A5%93")

        let req4 = MockTwitterAPIRequest(
            method: .delete,
            parameters: ["key": "value,🥓"]
        )

        XCTAssertEqual(req4.queryParameters as! [String: String], ["key": "value,🥓"])
        XCTAssertEqual(req4.bodyParameters as! [String: String], [:])

        let urlReq4 = try req4.buildRequest(environment: env)

        XCTAssertEqual(urlReq4.httpMethod, "DELETE")
        XCTAssertEqual(urlReq4.url?.query, "key=value%2C%F0%9F%A5%93")
        XCTAssertNil(urlReq4.httpBody)
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

        XCTAssertEqual(req.parameters as! [String: String], [:])
        XCTAssertEqual(req.queryParameters as! [String: String], ["key": "value,🥓"])
        XCTAssertEqual(req.bodyParameters as! [String: String], ["body": "あ"])

        let urlReq = try req.buildRequest(environment: env)

        XCTAssertEqual(urlReq.httpMethod, "POST")
        XCTAssertEqual(urlReq.url?.query, "key=value%2C%F0%9F%A5%93")
        XCTAssertEqual(String(data: urlReq.httpBody!, encoding: .utf8)!, "body=%E3%81%82")
    }

    public func testFormUrlEncodedBodyContentType() throws {
        let req = try MockTwitterAPIRequest(
            method: .post,
            parameters: ["key": "value,🥓"],
            bodyContentType: .wwwFormUrlEncoded
        ).buildRequest(environment: env)

        guard let httpBody = req.httpBody,
              let body = String(data: httpBody, encoding: .utf8) else {
            XCTFail("Failed to get HTTP body")
            return
        }

        XCTAssertEqual(body, "key=value%2C%F0%9F%A5%93")
    }

    // swiftlint:disable:next function_body_length
    func testMultipartFormDataBodyContentType() throws {
        let req = try MockTwitterAPIRequest(
            method: .post,
            parameters: [
                "a-value": MultipartFormDataPart.value(name: "a", value: "value"),
                "b-data": MultipartFormDataPart.data(
                    name: "b",
                    value: Data("ab".utf8),
                    filename: "test.txt",
                    mimeType: "plain/text"
                ),
            ],
            bodyContentType: .multipartFormData
        ).buildRequest(environment: env)
        
        guard let contentType = req.allHTTPHeaderFields?["Content-Type"],
              contentType.hasPrefix("multipart/form-data; boundary=TwitterAPIKit-"),
              let httpBody = req.httpBody,
              let body = String(data: httpBody, encoding: .utf8) else {
            XCTFail("Failed to get content type or body")
            return
        }
        
        let boundary = contentType.replacingOccurrences(
            of: "multipart/form-data; boundary=",
            with: ""
        )
        
        let expect = "--\(boundary)\r\n" +
        "Content-Disposition: form-data; name=\"a\"\r\n" +
        "\r\n" +
        "value\r\n" +
        "--\(boundary)\r\n" +
        "Content-Disposition: form-data; name=\"b\"; filename=\"test.txt\"\r\n" +
        "Content-Type: plain/text\r\n" +
        "\r\n" +
        "ab\r\n" +
        "--\(boundary)--\r\n"
        
        XCTAssertEqual(body, expect)
    }



    public func testInvalidMultipartFormData() throws {
        XCTAssertThrowsError(
            try MockTwitterAPIRequest(
                method: .post,
                parameters: ["key": "value,🥓"],
                bodyContentType: .multipartFormData
            ).buildRequest(environment: env)
        ) { error in
            XCTAssertTrue(error is TwitterAPIKitError, "Error should be TwitterAPIKitError")
        }
    }

    public func testJsonBodyContentType() throws {
        let req = try MockTwitterAPIRequest(
            method: .post,
            parameters: ["key": "value,🥓"],
            bodyContentType: .json
        ).buildRequest(environment: env)

        guard let httpBody = req.httpBody else {
            XCTFail("HTTP body should not be nil")
            return
        }

        let body = try JSONSerialization.jsonObject(with: httpBody, options: [])
        guard let bodyDict = body as? [String: String] else {
            XCTFail("Body should be [String: String]")
            return
        }

        XCTAssertEqual(bodyDict, ["key": "value,🥓"])
    }

    public func testInvalidJsonSerialization() throws {
        XCTAssertThrowsError(
            try MockTwitterAPIRequest(
                method: .post,
                parameters: ["key": Data()],
                bodyContentType: .json
            ).buildRequest(environment: env)
        ) { error in
            guard let apiError = error as? TwitterAPIKitError else {
                XCTFail("Error should be TwitterAPIKitError")
                return
            }
            guard case .jsonSerializationFailed = apiError.requestFailureReason else {
                XCTFail("Error should be jsonSerializationFailed")
                return
            }
        }
    }

    deinit {
        // De-init logic here
    }
}
// swiftlint:enable force_cast force_unwrapping
