import Foundation

public enum TwitterListIdentifierV1 {
    case listID(String)
    case slug(slug: String, owner: TwitterUserIdentifierV1)
}

extension TwitterListIdentifierV1 {
    func bind(param: inout [String: Any]) {
        switch self {
        case let .listID(string):
            param["list_id"] = string
        case let .slug(slug, owner):
            param["slug"] = slug
            switch owner {
            case let .userID(string):
                param["owner_id"] = string
            case let .screenName(string):
                param["owner_screen_name"] = string
            }
        }
    }
}
