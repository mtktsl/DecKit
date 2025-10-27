// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DecKit",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DecKit",
            targets: ["DecKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mtktsl/ShortConstraint.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DecKit",
            dependencies: [.product(name: "ShortConstraint", package: "ShortConstraint")]
        ),
        .testTarget(
            name: "DecKitTests",
            dependencies: ["DecKit"]
        ),
    ]
)
