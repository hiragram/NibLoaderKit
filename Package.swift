// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(iOS)
let excludes: [String] = ["macOS"]
#elseif os(macOS)
let excludes: [String] = ["iOS"]
#elseif os(tvOS)
let excludes: [String] = ["iOS", "macOS"]
#endif

#if os(iOS)
let testExcludes: [String] = ["macOS", "Fixtures/macOS", "Fixtures/tvOS"]
#elseif os(macOS)
let testExcludes: [String] = ["iOS", "Fixtures/iOS", "Fixtures/tvOS"]
#elseif os(tvOS)
let testExcludes: [String] = ["iOS", "macOS", "Fixtures/iOS", "Fixtures/macOS"]
#endif

let package = Package(
    name: "NibLoaderKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NibLoaderKit",
            targets: ["NibLoaderKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NibLoaderKit",
            dependencies: [],
            path: "Sources",
            exclude: excludes
        ),
        .testTarget(
            name: "NibLoaderKitTests",
            dependencies: ["NibLoaderKit"],
            path: "Tests/NibLoaderKit",
            exclude: testExcludes
        ),
    ]
)
