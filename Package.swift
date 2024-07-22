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
    dependencies: [
        .package(url: "https://github.com/apparata/SystemKit", exact: "1.7.0"),
    ],
    targets: [
        .executableTarget(
            name: "mkprivacy",
            dependencies: [
                "MakePrivacyKit",
            ],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
        .target(
            name: "MakePrivacyKit",
            dependencies: [
                "SystemKit"
            ],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
    ]
)
