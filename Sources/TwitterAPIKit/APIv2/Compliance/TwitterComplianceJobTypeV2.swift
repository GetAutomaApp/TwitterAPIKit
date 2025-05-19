// TwitterComplianceJobTypeV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public enum TwitterComplianceJobTypeV2: String {
    case tweets
    case users

    public func bind(param: inout [String: Any]) {
        param["type"] = rawValue
    }
}
