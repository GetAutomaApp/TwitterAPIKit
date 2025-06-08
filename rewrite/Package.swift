// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "TwitterAPIKit",
    platforms: [
        .macOS(.v15),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v6),
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
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", from: "3.8.0")
    ],
    targets: [
        .target(
            name: "TwitterAPIKit",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto")
            ]
        ),
        .executableTarget(
            name: "RetweetExample",
            dependencies: ["TwitterAPIKit"]
        ),
        .executableTarget(
            name: "PostTweetExample",
            dependencies: ["TwitterAPIKit"]
        ),
        .executableTarget(
            name: "GetUserTweetsExample",
            dependencies: ["TwitterAPIKit"]
        )
    ]
)