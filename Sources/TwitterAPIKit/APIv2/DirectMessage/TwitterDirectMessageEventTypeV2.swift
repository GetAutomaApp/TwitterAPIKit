// TwitterDirectMessageEventTypeV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// The set of event_types to include in the results.
public enum TwitterDirectMessageEventTypeV2: String {
    case messageCreate = "MessageCreate"
    case participantsJoin = "ParticipantsJoin"
    case participantsLeave = "ParticipantsLeave"
}

extension TwitterDirectMessageEventTypeV2: TwitterAPIv2RequestParameter {
    public var stringValue: String { return rawValue }
}

extension Set where Element == TwitterDirectMessageEventTypeV2 {
    func bind(param: inout [String: Any]) {
        param["event_types"] = commaSeparatedString
    }
}
