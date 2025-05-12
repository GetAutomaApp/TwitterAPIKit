import TwitterAPIKit
import XCTest

internal class CustomListsListRequestV1: GetListsListRequestV1 {
    public let custom: String

    override public var parameters: [String: Any] {
        var params = super.parameters
        params["custom"] = custom
        return params
    }

    public init(custom: String, user: TwitterUserIdentifierV1, reverse: Bool? = .none) {
        self.custom = custom
        super.init(user: user, reverse: reverse)
    }
}

internal class CapsuledListsListRequestV1: GetListsListRequestV1 {
    init() {
        super.init(user: .userID("100"), reverse: true)
    }
}

internal class ListRequestV1Tests: XCTestCase {
    // https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
    public func testGetListsListRequestV1() throws {
        XCTContext.runActivity(named: "with only required parameters") { _ in
            let list = GetListsListRequestV1(user: .userID("1234"))

            XCTAssertEqual(list.method, .get)
            XCTAssertEqual(list.path, "/1.1/lists/list.json")
            AssertEqualAnyDict(list.parameters, ["user_id": "1234"])
        }

        XCTContext.runActivity(named: "with all parameters") { _ in
            let list = GetListsListRequestV1(user: .screenName("name"), reverse: true)
            AssertEqualAnyDict(list.parameters, ["screen_name": "name", "reverse": true])
        }
    }

    public func testCustomListsListRequestV1() throws {
        let list = CustomListsListRequestV1(custom: "_custom_", user: .userID("12"))
        XCTAssertEqual(list.method, .get)
        XCTAssertEqual(list.path, "/1.1/lists/list.json")
        AssertEqualAnyDict(list.parameters, ["user_id": "12", "custom": "_custom_"])
    }

    public func testCapsuledListsListRequestV1() throws {
        let list = CapsuledListsListRequestV1()
        XCTAssertEqual(list.method, .get)
        XCTAssertEqual(list.path, "/1.1/lists/list.json")
        AssertEqualAnyDict(list.parameters, ["user_id": "100", "reverse": true])
    }

    deinit {
        // De-init Logic Here
    }
}
