// Result.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public extension Result where Failure == TwitterAPIKitError {
    /// Returns the success value if the result is a success, nil otherwise
    var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    /// Returns the error if the result is a failure, nil otherwise
    var error: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
