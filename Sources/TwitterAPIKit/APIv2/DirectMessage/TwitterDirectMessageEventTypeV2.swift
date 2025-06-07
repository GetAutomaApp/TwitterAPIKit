// TwitterDirectMessageEventTypeV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// The set of event_types to include in the results.
public enum TwitterDirectMessageEventTypeV2: String, Sendable {
    case messageCreate = "MessageCreate"
    case participantsJoin = "ParticipantsJoin"
    case participantsLeave = "ParticipantsLeave"
}

extension TwitterDirectMessageEventTypeV2: TwitterAPIv2RequestParameter {
    public var stringValue: String { rawValue }
}

/// Binds the event_types to the request parameters.
public extension Set<TwitterDirectMessageEventTypeV2> {
    /// Binds the event_types to the request parameters.
    func bind(param: inout [String: Any]) {
        param["event_types"] = commaSeparatedString
    }
}
