//
//  AppProfile.swift
//  ZZComponent

import Foundation

@objc public class AppProfile: NSObject {
    public static func sharedGroupIdentifier() -> String? {
        var bundle = Bundle.main
        var url = bundle.bundleURL
        if url.pathExtension == "appex" {
            url = url.deletingLastPathComponent().deletingLastPathComponent()
            bundle = Bundle(url: url) ?? Bundle.main
        }
        let bundleIdentifier = bundle.bundleIdentifier ?? ""
        return "group." + bundleIdentifier
    }

    @objc
    public static func sharedUrl() -> URL? {
        guard let groupID = sharedGroupIdentifier() else { return nil }
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)
    }

    @objc
    public static func sharedDatabaseUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("Whirlwind.realm")
    }

    @objc
    public static func sharedUserDefaults() -> UserDefaults? {
        guard let groupID = sharedGroupIdentifier() else { return nil }
        return UserDefaults(suiteName: groupID)
    }

    @objc
    public static func sharedGeneralConfUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("general.xxx")
    }

    @objc
    public static func sharedSocksConfUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("socks.xxx")
    }

    @objc
    public static func sharedProxyConfUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("proxy.xxx")
    }

    @objc
    public static func sharedHttpProxyConfUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("http.xxx")
    }

    @objc
    public static func sharedLogUrl() -> URL? {
        return sharedUrl()?.appendingPathComponent("tunnel.log")
    }
}
