//
//  RemoteConfigManager.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 24.08.2023.
//

import Foundation
import Firebase
import FirebaseRemoteConfig

private struct Constants {
    static let minimumFetchInterval: TimeInterval = 0
    static let timeInterval: TimeInterval = 3_600.0
}

struct RemoteConfigManager {
    
    private static var remoteConfig: RemoteConfig = {
        var remoteConfig = RemoteConfig.remoteConfig()
        var callIntervalSettings = RemoteConfigSettings()
        callIntervalSettings.minimumFetchInterval = Constants.minimumFetchInterval
        remoteConfig.configSettings = callIntervalSettings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        return remoteConfig
    }()
    
    static func configure(exprationDuration: TimeInterval = Constants.minimumFetchInterval) {
        remoteConfig.fetch(withExpirationDuration: exprationDuration) { (_, error) in
            if let error = error {
                return
            }
            RemoteConfig.remoteConfig().activate(completion: nil)
        }
    }
    
    static func value(for key: String?) -> String? {
        guard let key = key else {
            return nil
        }
        return remoteConfig.configValue(forKey: key).stringValue
    }
}
