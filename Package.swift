// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "LithoSharedContracts",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "LithoSharedContracts",
            targets: ["LithoSharedContracts"]
        )
    ],
    targets: [
        .target(
            name: "LithoSharedContracts",
            path: "Sources/LithoSharedContracts"
        )
    ]
)
