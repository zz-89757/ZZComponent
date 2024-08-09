//
//  Settings.swift
//  ZZComponent

import Foundation

@objc public class Settings: NSObject {
    @objc static let shared = Settings()
    private let userDefaults: UserDefaults?

    @objc private override init() {
        if let groupIdentifier = AppProfile.sharedGroupIdentifier() {
            userDefaults = UserDefaults(suiteName: groupIdentifier)
        } else {
            userDefaults = nil
        }
    }

    @objc func setStartTime(_ startTime: Date) {
        userDefaults?.set(startTime, forKey: "startTime")
        userDefaults?.synchronize()
    }

    @objc func startTime() -> Date? {
        return userDefaults?.object(forKey: "startTime") as? Date
    }
}
