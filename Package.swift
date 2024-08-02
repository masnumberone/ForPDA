// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ForPDA",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        // Features
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "ArticlesListFeature", targets: ["ArticlesListFeature"]),
        .library(name: "ArticleFeature", targets: ["ArticleFeature"]),
        .library(name: "MenuFeature", targets: ["MenuFeature"]),
        .library(name: "AuthFeature", targets: ["AuthFeature"]),
        .library(name: "ProfileFeature", targets: ["ProfileFeature"]),
        .library(name: "SettingsFeature", targets: ["SettingsFeature"]),
        
        // Clients
        .library(name: "APIClient", targets: ["APIClient"]),
        .library(name: "SettingsClient", targets: ["SettingsClient"]),
        .library(name: "ParsingClient", targets: ["ParsingClient"]),
        .library(name: "AnalyticsClient", targets: ["AnalyticsClient"]),
        .library(name: "ImageClient", targets: ["ImageClient"]),
        .library(name: "PasteboardClient", targets: ["PasteboardClient"]),
        
        // Shared
        .library(name: "Models", targets: ["Models"]),
        .library(name: "SharedUI", targets: ["SharedUI"]),
        .library(name: "TCAExtensions", targets: ["TCAExtensions"])
    ],
    dependencies: [
        .package(path: "../PDAPI"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.12.1"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", from: "5.3.0"),
        .package(url: "https://github.com/kean/Nuke.git", from: "12.8.0"),
        .package(url: "https://github.com/mixpanel/mixpanel-swift.git", from: "4.3.0"),
        .package(url: "https://github.com/getsentry/sentry-cocoa.git", from: "8.31.1"),
        .package(url: "https://github.com/SvenTiigi/YouTubePlayerKit.git", from: "1.8.0"),
        .package(url: "https://github.com/elai950/AlertToast.git", from: "1.3.9"),
        .package(url: "https://github.com/kirualex/SwiftyGif.git", from: "5.4.4")
    ],
    targets: [
        
        // MARK: - Features
        
        .target(
            name: "AppFeature",
            dependencies: [
                "ArticlesListFeature",
                "ArticleFeature",
                "MenuFeature",
                "AuthFeature",
                "ProfileFeature",
                "SettingsFeature",
                "AnalyticsClient",
                "ImageClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "AlertToast", package: "AlertToast")
            ]
        ),
        .target(
            name: "ArticlesListFeature",
            dependencies: [
                "Models",
                "SharedUI",
                "APIClient",
                "AnalyticsClient",
                "PasteboardClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke")
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "ArticleFeature",
            dependencies: [
                "Models",
                "SharedUI",
                "APIClient",
                "AnalyticsClient",
                "ParsingClient",
                "PasteboardClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke"),
                .product(name: "YouTubePlayerKit", package: "YouTubePlayerKit")
            ]
        ),
        .target(
            name: "MenuFeature",
            dependencies: [
                "SharedUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "AuthFeature",
            dependencies: [
                "APIClient",
                "TCAExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke")
            ]
        ),
        .target(
            name: "ProfileFeature",
            dependencies: [
                "APIClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke")
            ]
        ),
        .target(
            name: "SettingsFeature",
            dependencies: [
                "TCAExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        
        // MARK: - Clients
        
            .target(
                name: "APIClient",
                dependencies: [
                    "ParsingClient",
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "PDAPI", package: "PDAPI")
                ]
            ),
        .target(
            name: "SettingsClient",
            dependencies: [
                "Models",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "AnalyticsClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Mixpanel", package: "mixpanel-swift"),
                .product(name: "Sentry", package: "sentry-cocoa")
            ]
        ),
        .target(
            name: "ImageClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Nuke", package: "nuke")
            ]
        ),
        .target(
            name: "ParsingClient",
            dependencies: [
                "Models",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "PasteboardClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        
        // MARK: - Shared
        
        .target(
            name: "Models",
            dependencies: [
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "SharedUI",
            dependencies: [
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                .product(name: "SwiftyGif", package: "SwiftyGif")
            ]
        ),
        .target(
            name: "TCAExtensions",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        
        // MARK: - Tests
        
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)

for target in package.targets where target.type != .binary {
    var swiftSettings = target.swiftSettings ?? []
    
    #if !hasFeature(ExistentialAny)
    swiftSettings.append(.enableUpcomingFeature("ExistentialAny"))
    #endif
    
    target.swiftSettings = swiftSettings
}
