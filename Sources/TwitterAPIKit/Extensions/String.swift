import Foundation

extension String {
    internal var urlEncoded: String {
        self.addingPercentEncoding(
            withAllowedCharacters: CharacterSet(
                charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~"
            )
        // swiftlint:disable:next force_unwrapping
        )!
    }
}
