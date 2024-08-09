//
//  AboutApp.swift
//  WhirlwindControl

import Foundation
import UIKit

public struct App {

    public static var appName: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }

    public static var appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }

    public static var appBuild: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }

    public static var bundleIdentifier: String {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }

    public static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }

    public static var appStoreURL: URL {
        return URL(string: "")!
    }
// //当前语言环境
    public static var language: String {
        guard let languages: [String] = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] else { return "zh-Han" }
        return languages[0]
    }

    public static var appVersionAndBuild: String {
        let version = appVersion, build = appBuild
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }

    public static var IDFV: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}

