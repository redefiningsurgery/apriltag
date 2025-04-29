// swift-tools-version: 5.9
import PackageDescription

let cFlags = [
  "-DTAGSTANDARD41H12=1",
  "-O3", "-fPIC"
]

let package = Package(
  name: "apriltag",
  platforms: [.iOS(.v15), .visionOS(.v1)],
  products: [
    .library(name: "apriltag", targets: ["apriltag"])
  ],
  targets: [
    .target(
      name: "apriltag",
      path: ".",                // root contains C sources & headers
      exclude: ["examples", "python", "CMakeLists.txt", "README.md"],
      publicHeadersPath: "apriltag",
      cSettings: [.unsafeFlags(cFlags, .when(configuration: .release))]
    )
  ]
)

