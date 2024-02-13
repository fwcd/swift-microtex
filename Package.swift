// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-microtex",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MicroTeX",
            targets: ["MicroTeX"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CppMicroTeX",
            dependencies: [.target(name: "CTinyXML2")],
            path: "./MicroTeX",
            exclude: [
                "src/res/font/README",
                // cd MicroTeX && find src -name meson.build
                // TODO: Automate this (or figure out if there's some way to glob from SPM?)
                "src/res/sym/meson.build",
                "src/res/reg/meson.build",
                "src/res/parser/meson.build",
                "src/res/meson.build",
                "src/res/font/meson.build",
                "src/res/builtin/meson.build",
                "src/box/meson.build",
                "src/core/meson.build",
                "src/atom/meson.build",
                "src/platform/qt/meson.build",
                "src/platform/cairo/meson.build",
                "src/platform/meson.build",
                "src/utils/meson.build",
                "src/meson.build",
                "src/graphic/meson.build",
                "src/samples/meson.build",
                "src/fonts/meson.build",
            ],
            sources: ["src"],
            publicHeadersPath: "src",
            cxxSettings: [.unsafeFlags(["-std=c++17"])]
        ),
        .systemLibrary(
            name: "CTinyXML2",
            pkgConfig: "tinyxml2",
            providers: [
                .apt(["libtinyxml2-dev"]),
                .brew(["tinyxml2"]),
            ]
        ),
        .target(
            name: "MicroTeX"
        ),
        .testTarget(
            name: "MicroTeXTests",
            dependencies: ["MicroTeX"]
        ),
    ]
)
