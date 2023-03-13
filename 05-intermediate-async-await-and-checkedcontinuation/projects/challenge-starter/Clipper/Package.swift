// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Clipper",
  platforms: [.macOS(.v12)],
  dependencies: [
    // open PR to fix this [Fix build on linux by adding a missing #else #1](https://github.com/Zollerboy1/SwiftCommand/pull/1)
    .package(url: "https://github.com/doozMen/SwiftCommand.git", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "Clipper",
      dependencies: [
        .product(name: "SwiftCommand", package: "SwiftCommand")
      ])
  ]
)
