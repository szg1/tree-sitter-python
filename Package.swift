// swift-tools-version: 5.9
import PackageDescription

// ProjectAtlas fork of https://github.com/tree-sitter/tree-sitter-python
// at v0.25.0. Change vs upstream: explicit C sources. Upstream computes
// `sources` with FileManager at manifest-evaluation time, which silently
// drops src/scanner.c when the manifest is loaded from another package's
// checkout — leaving the external-scanner symbols undefined at link time.
let package = Package(
    name: "TreeSitterPython",
    products: [
        .library(name: "TreeSitterPython", targets: ["TreeSitterPython"]),
    ],
    targets: [
        .target(
            name: "TreeSitterPython",
            path: ".",
            sources: ["src/parser.c", "src/scanner.c"],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
    ],
    cLanguageStandard: .c11
)
