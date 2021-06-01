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
        .package(url: "https://github.com/TICESoftware/swift-sodium.git", .branch("spmWorkaround")),
        .package(url: "https://github.com/TICESoftware/Clibsodium.git", from: "1.0.1"),
    ],
    targets: [
        .target(
            name: "HKDF",
            dependencies: ["Sodium", "Clibsodium"]),
        .testTarget(
            name: "HKDFTests",
            dependencies: ["HKDF", "Sodium", "Clibsodium"]),
    ]
)
