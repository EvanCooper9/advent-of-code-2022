// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2022",
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode2022",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            resources: [
                .process("Inputs")
            ]
        ),
    ]
)
