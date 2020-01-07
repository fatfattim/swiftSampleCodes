//
//  PropertyWrapper.swift
//  swift.sample
//
//  Created by Tim Chen on 2020/1/7.
//  Copyright © 2020 fatfattim. All rights reserved.
//

import Foundation

class PropertyWrapper {
    
    private func printUserDefault() {
        
    }
}

// User Defaults
@propertyWrapper
struct UserDefault<T> {
  let key: String
  let defaultValue: T
  
  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

enum UserDefaultsKeys: String {
    // MARK: - UserProfile
    case r20
    case videoQuality
}

struct GlobalSettings {
    
    @UserDefault(key: UserDefaultsKeys.r20.rawValue, defaultValue: false)
    static var r20FeatureEnabled: Bool
  
    @UserDefault(key: UserDefaultsKeys.videoQuality.rawValue, defaultValue: "1080p")
    static var videoQuality: String
    
    public static func reset() {
        UserDefaults.standard.dictionaryRepresentation()
            .filter { UserDefaultsKeys(rawValue: $0.key) != nil }
            .forEach { UserDefaults.standard.removeObject(forKey: $0.key) }
    }
}


