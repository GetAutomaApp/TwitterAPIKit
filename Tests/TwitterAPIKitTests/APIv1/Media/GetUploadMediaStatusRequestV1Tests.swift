import TwitterAPIKit
import XCTest

internal class GetUploadMediaStatusRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetUploadMediaStatusRequestV1(mediaID: "m")

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/1.1/media/upload.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "command": "STATUS",
                "media_id": "m",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
