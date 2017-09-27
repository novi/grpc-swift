// swift-tools-version:4.0
/*
 * Copyright 2017, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import PackageDescription

let package = Package(
  name: "SwiftGRPC",
  products: [
    .library(name: "gRPC", targets: ["gRPC"]),
  ],
  dependencies: [
      //.package(url: "https://github.com/IBM-Swift/OpenSSL.git", .upToNextMinor(from: "0.3.0") ),
      .package(url: "https://github.com/quanvo87/OpenSSL-OSX.git", .branch("swift4")),
      .package(url: "https://github.com/novi/CZlib.git", .branch("pkgconfig-zlib"))
  ],
  targets: [
    .target(name: "CgRPC", dependencies: [
        "OpenSSL",
        "CZlib"
    ]),
    .target(name: "gRPC",
            dependencies: ["CgRPC"]
    ),
    .testTarget(
        name: "gRPCTests",
        dependencies: [.target(name: "gRPC")]
    ),
  ]
)
