// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "RPC",
    products: [
        .library(name: "XMLRPC", targets: ["XMLRPC"])
    ],
    dependencies: [
        .package(path: "../xml"),
        .package(path: "../radix"),
        .package(path: "../test")
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
