// TwitterAPIKitErrorTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterAPIKitErrorTests: XCTestCase {
    public func testInit() throws {
        XCTContext.runActivity(named: "unknown") { _ in

            let error = TwitterAPIKitError(error: NSError(domain: "", code: 0, userInfo: nil))
            XCTAssertTrue(error.isUnkonwn)
        }
        XCTContext.runActivity(named: "TwitterAPIKitError") { _ in
            let error = TwitterAPIKitError(
                error: TwitterAPIKitError.responseFailed(reason: .invalidResponse(error: nil))
            )
            XCTAssertFalse(error.isUnkonwn)
            XCTAssertTrue(error.isResponseFailed)
        }
    }

    public func testRequestFailed() throws {
        XCTAssertTrue(TwitterAPIKitError.requestFailed(reason: .invalidURL(url: "")).isRequestFailed)
        XCTAssertTrue(
            TwitterAPIKitError.requestFailed(reason: .invalidParameter(parameter: [:], cause: "hoge")).isRequestFailed
        )
        XCTAssertTrue(TwitterAPIKitError.requestFailed(reason: .cannotEncodeStringToData(string: "")).isRequestFailed)
        XCTAssertTrue(
            TwitterAPIKitError.requestFailed(
                reason: .jsonSerializationFailed(obj: [:])
            ).isRequestFailed
        )
    }

    public func testResponseFailed() throws {
        XCTAssertTrue(TwitterAPIKitError.responseFailed(reason: .invalidResponse(error: nil)).isResponseFailed)
        XCTAssertTrue(
            TwitterAPIKitError.responseFailed(
                reason: .unacceptableStatusCode(statusCode: 200, error: .unknown(Data()), rateLimit: .init(header: [:]))
            ).isResponseFailed
        )
    }

    public func testResponseSerializationFailure() throws {
        XCTAssertTrue(
            TwitterAPIKitError.responseSerializeFailed(
                reason: .jsonSerializationFailed(error: NSError(domain: "", code: 0, userInfo: nil))
            ).isResponseSerializeFailed
        )
        XCTAssertTrue(
            TwitterAPIKitError.responseSerializeFailed(
                reason: .jsonDecodeFailed(
                    error: DecodingError.typeMismatch(
                        Any.self, .init(codingPath: [], debugDescription: "", underlyingError: nil)
                    )
                )
            ).isResponseSerializeFailed
        )
        XCTAssertTrue(
            TwitterAPIKitError.responseSerializeFailed(
                reason: .cannotConvert(data: Data(), toTypeName: "")
            ).isResponseSerializeFailed
        )
    }

    public func testUploadMediaFailure() throws {
        XCTAssertTrue(
            TwitterAPIKitError.uploadMediaFailed(
                reason: .processingFailed(error: .init(code: 1, name: "n", message: "m"))
            ).isUploadMediaFailed
        )
    }

    public func testUnknown() throws {
        XCTAssertTrue(TwitterAPIKitError.unkonwn(error: NSError(domain: "", code: 0, userInfo: nil)).isUnkonwn)
    }

    deinit {
        // De-init Logic Here
    }
}
