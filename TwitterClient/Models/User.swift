//
//  User.swift
//  TwitterClient
//
//  Created by Darya Markova on 17.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//

import UIKit
class User {
    static let userDidLogoutNotification = "UserDidLogout"
    var dictionary: NSDictionary?
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary;
    }
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if (_currentUser == nil) {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUser") as? Data
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUser")
            } else {
                defaults.set(nil, forKey: "currentUser");
            }
        }
    }
}
