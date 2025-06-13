// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TwitterAPIKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "TwitterAPIKit",
            targets: ["TwitterAPIKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", from: "3.1.0"),
    ],
    targets: [
        .target(
            name: "TwitterAPIKit",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
            ]
        ),
        .testTarget(
            name: "TwitterAPIKitTests",
            dependencies: ["TwitterAPIKit"]
        ),
        .executableTarget(
            name: "GetUserByIdExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetUserByIdExample"
        ),
        .executableTarget(
            name: "GetUsersByIdsExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetUsersByIdsExample"
        ),
        .executableTarget(
            name: "GetUserByUsernameExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetUserByUsernameExample"
        ),
        .executableTarget(
            name: "GetUsersByUsernamesExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetUsersByUsernamesExample"
        ),
        .executableTarget(
            name: "GetAuthenticatedUserExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetAuthenticatedUserExample"
        ),
        .executableTarget(
            name: "RetweetExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/RetweetExample"
        ),
        .executableTarget(
            name: "GetTweetsCountsAllExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetTweetsCountsAllExample"
        ),
        .executableTarget(
            name: "GetTweetsCountsRecentExample",
            dependencies: ["TwitterAPIKit"],
            path: "Sources/Examples/GetTweetsCountsRecentExample"
        ),
    ]
)