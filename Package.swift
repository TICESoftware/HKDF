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
        .package(url: "https://github.com/jedisct1/swift-sodium.git", from: "0.8.0"),
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
