// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "LinkedList",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "LinkedList",
            targets: ["LinkedList"]),
    ],
    targets: [
        .target(
            name: "LinkedList",
            dependencies: []),
        .testTarget(
            name: "LinkedListTests",
            dependencies: ["LinkedList"]),
    ]
)
