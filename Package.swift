// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "HKDF",
    products: [
        .library(
            name: "HKDF",
            targets: ["HKDF"]),
    ],
    dependencies: [
        .package(url: "https://github.com/TICESoftware/swift-sodium.git", .branch("linux"))
    ],
    targets: [
        .target(
            name: "HKDF",
            dependencies: ["Sodium"]),
        .testTarget(
            name: "HKDFTests",
            dependencies: ["HKDF", "Sodium"]),
    ]
)
