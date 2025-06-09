# Twitter API v2 Migration Plan

This document outlines the plan for migrating the Twitter API v2 requests to the new and improved Twitter API rewrite.

## 1. Core Infrastructure Setup
- [x] Create base request protocol in the new rewrite
  - [x] Implement `TwitterAPIRequest` protocol
  - [x] Set up request/response types
  - [x] Implement authentication handling
- [x] Set up example targets in Package.swift for each endpoint category

## 2. Field and Expansion Types Migration
- [x] Migrate `TwitterTweetFieldsV2.swift`
- [x] Migrate `TwitterDmEventExpansionsV2.swift`
- [x] Create new field and expansion enums with improved type safety

## 3. API Endpoint Migration (by category)
For each category below, we need to:
1. Create the request/response types
2. Create an example target in Package.swift
3. Create a working example in the Examples directory

### Users
- [ ] Add `GetUserExample` target to Package.swift
- [ ] Migrate user lookup endpoints
- [ ] Create example implementation

### Tweets
- [ ] Add `PostTweetExample` target (already exists)
- [ ] Add `GetTweetExample` target
- [ ] Migrate tweet endpoints
- [ ] Create example implementations

### Friendships
- [ ] Add `GetFollowersExample` target
- [ ] Migrate followers endpoints
- [ ] Create example implementation

### Direct Messages
- [ ] Add `SendDmExample` target
- [ ] Migrate DM endpoints
- [ ] Create example implementation

### Lists
- [ ] Add `ListManagementExample` target
- [ ] Migrate list endpoints
- [ ] Create example implementation

### Search
- [ ] Add `SearchTweetsExample` target
- [ ] Migrate search endpoints
- [ ] Create example implementation

### Timeline
- [ ] Add `GetUserTweetsExample` target (already exists)
- [ ] Migrate timeline endpoints
- [ ] Create example implementation

### Spaces
- [ ] Add `GetSpaceExample` target
- [ ] Migrate space endpoints
- [ ] Create example implementation

### Bookmarks
- [ ] Add `BookmarkManagementExample` target
- [ ] Migrate bookmark endpoints
- [ ] Create example implementation

### Block and Mute
- [ ] Add `BlockManagementExample` target
- [ ] Migrate block/mute endpoints
- [ ] Create example implementation

### Compliance
- [ ] Add `ComplianceJobExample` target
- [ ] Migrate compliance endpoints
- [ ] Create example implementation

### Stream
- [ ] Add `StreamTweetsExample` target
- [ ] Migrate stream endpoints
- [ ] Create example implementation

## 4. Example Structure
Each example should follow this pattern:

```swift
@main
struct CategoryExample {
    static func main() async throws {
        // 1. Set up credentials
        let simpleClient = TwitterAPISession(
            consumerKey: "CONSUMER_KEY",
            consumerSecret: "CONSUMER_KEY_SECRET",
            oauthToken: "OAUTH_TOKEN",
            oauthTokenSecret: "OAUTH_SECRET_TOKEN"
        )
        
        // 2. Create and send request
        let request = CategoryRequestV2(/* parameters */)
        let response = try await simpleClient.send(request)
        
        // 3. Handle response
        print("Response: \(response)")
    }
}
```

## 5. Package.swift Updates
For each new example, add to Package.swift:

```swift
.executable(
    name: "CategoryExample",
    targets: ["CategoryExample"]
),
// ...
.executableTarget(
    name: "CategoryExample",
    dependencies: ["TwitterAPIKit"],
    path: "Sources/Examples/CategoryExample"
)
```

## 6. Testing and Validation
- [ ] Create unit tests for each migrated endpoint
- [ ] Test example implementations
- [ ] Validate response parsing
- [ ] Test error handling

## 7. Documentation
- [ ] Update API documentation
- [ ] Document example usage
- [ ] Create migration guide
- [ ] Document breaking changes

## Current Structure
The rewrite is organized as follows:

```
rewrite/
├── Package.swift
├── Sources/
│   ├── TwitterAPIKit/
│   │   ├── APIv2/
│   │   ├── AuthAPI/
│   │   ├── TwitterAPISession.swift
│   │   ├── OAuthHelper.swift
│   │   ├── TwitterAPIKitError.swift
│   │   ├── TwitterAPIRequest.swift
│   │   ├── TwitterRateLimit.swift
│   │   └── TwitterAPIKit.swift
│   └── Examples/
│       ├── PostTweetExample/
│       └── GetUserTweetsExample/
└── Tests/
```

## Migration Progress
- [x] Initial project structure
- [x] Basic authentication setup
- [x] Example structure defined
- [ ] API endpoint migration started
- [ ] Documentation updates

## Notes
- Each endpoint category should have its own example target
- Examples should demonstrate proper error handling
- All examples should include proper documentation
- Rate limiting should be handled appropriately
- Authentication should be properly managed 