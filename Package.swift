// swift-tools-version: 5.11
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
            name: "CxxMicroTeX",
            dependencies: [
                .target(name: "CFontConfig"),
                .target(name: "CTinyXML2"),
                .target(name: "CxxCairomm"),
                .target(name: "CxxPangomm"),
            ],
            path: "./MicroTeX",
            exclude: [
                "src/samples",
                // (cd MicroTeX && find src -type f ! \( -name '*.cpp' -o -name '*.h' \)) | sort
                // TODO: Automate this (or figure out if there's some way to glob from SPM?)
                "src/QtLatex.pri",
                "src/atom/meson.build",
                "src/box/meson.build",
                "src/core/meson.build",
                "src/fonts/meson.build",
                "src/graphic/meson.build",
                "src/meson.build",
                "src/platform/cairo/meson.build",
                "src/platform/meson.build",
                "src/platform/qt/meson.build",
                "src/res/builtin/meson.build",
                "src/res/font/README",
                "src/res/font/meson.build",
                "src/res/meson.build",
                "src/res/parser/meson.build",
                "src/res/reg/meson.build",
                "src/res/sym/meson.build",
                "src/utils/meson.build",
            ],
            sources: ["src"],
            publicHeadersPath: "src",
            cxxSettings: [
                .define("BUILD_GTK"),
                .unsafeFlags(["-std=c++17", "-UDEBUG"]),
            ]
        ),
        .systemLibrary(
            name: "CFontConfig",
            pkgConfig: "fontconfig",
            providers: [
                .apt(["libfontconfig1-dev"]),
                .brew(["fontconfig"]),
            ]
        ),
        .systemLibrary(
            name: "CTinyXML2",
            pkgConfig: "tinyxml2",
            providers: [
                .apt(["libtinyxml2-dev"]),
                .brew(["tinyxml2"]),
            ]
        ),
        .systemLibrary(
            name: "CxxCairomm",
            pkgConfig: "cairomm-1.16",
            providers: [
                .apt(["libcairomm-1.16-dev"]),
                .brew(["cairomm"]),
            ]
        ),
        .systemLibrary(
            name: "CxxPangomm",
            pkgConfig: "pangomm-2.48",
            providers: [
                .apt(["libpangomm-2.48-dev"]),
                .brew(["pangomm"]),
            ]
        ),
        .target(
            name: "CxxMicroTeXSupport",
            publicHeadersPath: ".",
            cxxSettings: [.unsafeFlags(["-std=c++17"])]
        ),
        .target(
            name: "MicroTeX",
            dependencies: [
                .target(name: "CxxMicroTeX"),
                .target(name: "CxxMicroTeXSupport"),
            ],
            resources: [.process("../../MicroTeX/res")],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .executableTarget(
            name: "microtex-demo",
            dependencies: [.target(name: "MicroTeX")],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .testTarget(
            name: "MicroTeXTests",
            dependencies: ["MicroTeX"]
        ),
    ]
)
