import Foundation

public enum TwitterReplySettingsV2: String, Decodable, Sendable {
    case everyone
    case following
    case mentionedUsers = "mentioned_users"

    public func bind(param: inout [String: Any]) {
        param["reply_settings"] = rawValue
    }
}
