// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "XMLRPC",
    products: [
        .library(name: "XMLRPC", targets: ["XMLRPC"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-code/xml.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/radix.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "XMLRPC",
            dependencies: ["XML", "Base64"]),
        .testTarget(
            name: "XMLRPCTests",
            dependencies: ["XMLRPC", "Test"])
    ]
)
