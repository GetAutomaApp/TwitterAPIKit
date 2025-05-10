import Foundation

extension Result where Failure == TwitterAPIKitError {
    var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    var error: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
