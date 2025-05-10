import TwitterAPIKit
import XCTest

internal class GetUsersBlockingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersBlockingRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 100,
            paginationToken: "token",
            tweetFields: [.entities, .geo, .contextAnnotations],
            userFields: [.profileImageUrl, .protected, .publicMetrics]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/blocking")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.queryParameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 100,
                "pagination_token": "token",
                "tweet.fields": "context_annotations,entities,geo",
                "user.fields": "profile_image_url,protected,public_metrics",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersBlockingRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
