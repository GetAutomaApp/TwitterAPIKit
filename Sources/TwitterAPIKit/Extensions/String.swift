import Foundation

internal extension String {
    public var urlEncoded: String {
        // swiftlint:disable:next force_unwrapping
        self.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~"))!
    }
}