// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "XMLRPC",
    products: [
        .library(name: "XMLRPC", targets: ["XMLRPC"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/xml.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/radix.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
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
