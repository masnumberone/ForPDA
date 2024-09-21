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
        .library(name: "BookmarksFeature", targets: ["BookmarksFeature"]),
        .library(name: "ForumFeature", targets: ["ForumFeature"]),
        .library(name: "MenuFeature", targets: ["MenuFeature"]),
        .library(name: "AuthFeature", targets: ["AuthFeature"]),
        .library(name: "ProfileFeature", targets: ["ProfileFeature"]),
        .library(name: "SettingsFeature", targets: ["SettingsFeature"]),
        
        // Clients
        .library(name: "APIClient", targets: ["APIClient"]),
        .library(name: "CacheClient", targets: ["CacheClient"]),
        .library(name: "ParsingClient", targets: ["ParsingClient"]),
        .library(name: "AnalyticsClient", targets: ["AnalyticsClient"]),
        .library(name: "PasteboardClient", targets: ["PasteboardClient"]),
        .library(name: "NotificationsClient", targets: ["NotificationsClient"]),
        .library(name: "HapticClient", targets: ["HapticClient"]),
        .library(name: "PersistenceKeys", targets: ["PersistenceKeys"]),
        
        // Shared
        .library(name: "Models", targets: ["Models"]),
        .library(name: "SharedUI", targets: ["SharedUI"]),
        .library(name: "TCAExtensions", targets: ["TCAExtensions"])
    ],
    dependencies: [
        .package(path: "../../PDAPI"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.15.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", from: "5.3.0"),
        .package(url: "https://github.com/hyperoslo/Cache.git", from: "7.3.0"),
        .package(url: "https://github.com/kean/Nuke.git", from: "12.8.0"),
        .package(url: "https://github.com/appmetrica/appmetrica-sdk-ios", from: "5.8.0"),
        .package(url: "https://github.com/appmetrica/push-sdk-ios", from: "2.0.0"),
        .package(url: "https://github.com/CSolanaM/SkeletonUI.git", from: "2.0.2"),
        .package(url: "https://github.com/SvenTiigi/YouTubePlayerKit.git", from: "1.9.0"),
        .package(url: "https://github.com/SubvertDev/AlertToast.git", revision: "d0f7d6b"),
        .package(url: "https://github.com/kirualex/SwiftyGif.git", from: "5.4.4")
    ],
    targets: [
        
        // MARK: - Features
        
        .target(
            name: "AppFeature",
            dependencies: [
                "ArticlesListFeature",
                "ArticleFeature",
                "BookmarksFeature",
                "ForumFeature",
                "MenuFeature",
                "AuthFeature",
                "ProfileFeature",
                "SettingsFeature",
                "AnalyticsClient",
                "CacheClient",
                "NotificationsClient",
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
                "HapticClient",
                "TCAExtensions",
                "PersistenceKeys",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "ArticleFeature",
            dependencies: [
                "Models",
                "SharedUI",
                "APIClient",
                "CacheClient",
                "AnalyticsClient",
                "ParsingClient",
                "PasteboardClient",
                "TCAExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SkeletonUI", package: "SkeletonUI"),
                .product(name: "NukeUI", package: "nuke"),
                .product(name: "YouTubePlayerKit", package: "YouTubePlayerKit"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "BookmarksFeature",
            dependencies: [
                "Models",
                "SharedUI",
                "APIClient",
                "CacheClient",
                "PasteboardClient",
                "AnalyticsClient",
                "PersistenceKeys",
                "TCAExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SkeletonUI", package: "SkeletonUI"),
                .product(name: "NukeUI", package: "nuke"),
            ]
        ),
        .target(
            name: "ForumFeature",
            dependencies: [
                "Models",
                "SharedUI",
                "APIClient",
                "CacheClient",
                "AnalyticsClient",
                "ParsingClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke")
            ]
        ),
        .target(
            name: "MenuFeature",
            dependencies: [
                "APIClient",
                "PersistenceKeys",
                "AnalyticsClient",
                "CacheClient",
                "SharedUI",
                "TCAExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SkeletonUI", package: "SkeletonUI"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "AuthFeature",
            dependencies: [
                "APIClient",
                "AnalyticsClient",
                "HapticClient",
                "PersistenceKeys",
                "TCAExtensions",
                "SharedUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "nuke"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "ProfileFeature",
            dependencies: [
                "APIClient",
                "AnalyticsClient",
                "PersistenceKeys",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SkeletonUI", package: "SkeletonUI"),
                .product(name: "NukeUI", package: "nuke")
            ]
        ),
        .target(
            name: "SettingsFeature",
            dependencies: [
                "AnalyticsClient",
                "PasteboardClient",
                "CacheClient",
                "TCAExtensions",
                "Models",
                "SharedUI",
                "PersistenceKeys",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        
        // MARK: - Clients
        
            .target(
                name: "APIClient",
                dependencies: [
                    "ParsingClient",
                    "CacheClient",
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "PDAPI", package: "PDAPI")
                ]
            ),
        .target(
            name: "PersistenceKeys",
            dependencies: [
                "Models",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "AnalyticsClient",
            dependencies: [
                "Models",
                "PersistenceKeys",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
                .product(name: "AppMetricaCrashes", package: "appmetrica-sdk-ios")
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
        .target(
            name: "NotificationsClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "AppMetricaPush", package: "push-sdk-ios")
            ]
        ),
        .target(
            name: "HapticClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "CacheClient",
            dependencies: [
                "Models",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Cache", package: "Cache"),
                .product(name: "Nuke", package: "nuke")
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
                .product(name: "NukeUI", package: "nuke"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                .product(name: "SwiftyGif", package: "SwiftyGif"),
                .product(name: "SkeletonUI", package: "SkeletonUI")
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
    swiftSettings.append(
        .unsafeFlags(["-Xfrontend",
                      "-warn-long-function-bodies=600",
                      "-Xfrontend",
                      "-warn-long-expression-type-checking=100"])
    )
    #endif
    
    target.swiftSettings = swiftSettings
}
