// swift-tools-version: 5.9

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
        )
    ]
)