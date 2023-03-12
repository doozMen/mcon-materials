// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Clipper",
  platforms: [.macOS(.v12)],
  dependencies: [
    .package(url: "https://github.com/Zollerboy1/SwiftCommand.git", from: "1.1.2")
  ],
  targets: [
    .executableTarget(
      name: "Clipper",
      dependencies: [
        .product(name: "SwiftCommand", package: "SwiftCommand")
      ])
  ]
)
