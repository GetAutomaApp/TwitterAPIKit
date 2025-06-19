import Foundation

public enum TwitterReplySettingsV2: String, Decodable, Sendable {
    case mentionedUsers = "mentioned_users"
    case following
    case everyone

    public func bind(param: inout [String: Any]) {
        param["reply_settings"] = rawValue
    }
}