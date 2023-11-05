//
//  AppDelegate.swift
//  ForPDA
//
//  Created by Subvert on 04.12.2022.
//

import UIKit
import SnapKit
import Factory
import Amplitude
import Sentry
import Nuke
import RouteComposer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    @Injected(\.settingsService) private var settingsService
    @Injected(\.cookiesService) private var cookiesService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureAmplitude()
        configureSentry()
        configureNuke()
        configureCookies()
        
        return true
    }
}

// MARK: - Configuration

extension AppDelegate {
    
    // MARK: Amplitude
    
    private func configureAmplitude() {
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().initializeApiKey(Secrets.for(key: .AMPLITUDE_TOKEN))
    }
    
    // MARK: Sentry
    
    private func configureSentry() {
        SentrySDK.start { options in
            options.dsn = Secrets.for(key: .SENTRY_DSN)
            options.debug = AppScheme.isDebug
            options.enabled = !AppScheme.isDebug
            options.tracesSampleRate = 1.0
            options.diagnosticLevel = .warning
            options.attachScreenshot = true
        }
    }
    
    // MARK: Nuke

    private func configureNuke() {
        ImagePipeline.shared = ImagePipeline(configuration: .withDataCache)
    }
    
    // MARK: Cookies
    
    private func configureCookies() {
        cookiesService.configureCookies()
    }
}
