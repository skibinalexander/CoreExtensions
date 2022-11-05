// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreExtensions",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "CoreExtensions",
            targets: ["CoreExtensions"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoreExtensions",
            dependencies: [])
    ]
)
