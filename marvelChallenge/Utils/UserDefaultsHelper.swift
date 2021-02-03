//
//  UserDefaultsHelper.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 02/02/2021.
//

import Foundation

enum UserDefaultsKeys: String {
    case email
    case provider
  }


class UserDefaultsHelper {
    static let Shared = UserDefaultsHelper()
    
    
    func saveValue(value: Any, key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getValue(key: UserDefaultsKeys) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
    
    func removeValue(key: UserDefaultsKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
