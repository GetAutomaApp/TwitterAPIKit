// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "TwitterAPIKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TwitterAPIKit",
            targets: ["TwitterAPIKit"]
        ),
        .executable(
            name: "PostTweetExample",
            targets: ["PostTweetExample"]
        ),
        .executable(
            name: "GetUserTweetsExample",
            targets: ["GetUserTweetsExample"]
        ),
        .executable(
            name: "GetTweetExample",
            targets: ["GetTweetExample"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TwitterAPIKit",
            dependencies: []
        ),
        .executableTarget(
            name: "PostTweetExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/PostTweetExample"
        ),
        .executableTarget(
            name: "GetUserTweetsExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetUserTweetsExample"
        ),
        .executableTarget(
            name: "GetTweetExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetTweetExample"
        )
    ]
)