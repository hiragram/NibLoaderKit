// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var excludes: [String] = []
#if !os(iOS)
excludes.append("iOS")
#endif
#if !os(macOS)
excludes.append("macOS")
#endif
#if !os(tvOS)
excludes.append("tvOS")
#endif

var testExcludes: [String] = []
#if !os(iOS)
testExcludes += ["iOS", "Fixtures/iOS"]
#endif
#if !os(macOS)
textExcludes += ["macOS", "Fixtures/macOS"]
#endif
#if !os(tvOS)
testExcludes += ["tvOS", "Fixtures/tvOS"]
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
