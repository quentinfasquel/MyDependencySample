// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MyWrapperLibrary",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "MyWrapperLibrary", type: .dynamic, targets: ["libMyCppLibrary", "MyWrapperLibrary"]),
    ],
    dependencies: [],
    targets: [

        // C++ library `libMyCppLibrary.a` distributed as an XCFramework
        .binaryTarget(
            name: "libMyCppLibrary",
            path: "libs/libMyCppLibrary.xcframework"),

        // Objective-C module (`dynamic` to become a framework
        .target(
            name: "MyWrapperLibrary",
            dependencies: ["libMyCppLibrary"]),

        // Swift Unit Tests
        .testTarget(
            name: "MyWrapperLibraryTests",
            dependencies: ["MyWrapperLibrary"]),
    ]
)
