// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "mkprivacy",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "mkprivacy", targets: ["mkprivacy"])
    ],
    targets: [
        .executableTarget(
            name: "mkprivacy",
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
    ]
)
