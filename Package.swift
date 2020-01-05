// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "RPC",
    products: [
        .library(name: "XMLRPC", targets: ["XMLRPC"])
    ],
    dependencies: [
        .package(path: "../XML"),
        .package(path: "../Radix"),
        .package(path: "../Test")
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
