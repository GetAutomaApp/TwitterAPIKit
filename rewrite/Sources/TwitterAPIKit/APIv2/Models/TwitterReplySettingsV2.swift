    public enum TwitterReplySettingsV2: String {
        case mentionedUsers
        case following
        case everyone

        public func bind(param: inout [String: Any]) {
            param["reply_settings"] = rawValue
        }
    }