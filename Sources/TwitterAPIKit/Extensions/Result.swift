// Result.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

extension Result where Failure == TwitterAPIKitError {
    /// Returns the success value if the result is a success, nil otherwise
    public var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    /// Returns the error if the result is a failure, nil otherwise
    public var error: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
