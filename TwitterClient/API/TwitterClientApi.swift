//
//  TwitterClientApi.swift
//  TwitterClient
//
//  Created by Darya Markova on 17.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//


import Foundation
import BDBOAuth1Manager

class TwitterClientApi: BDBOAuth1SessionManager {
    //let secretKey = "5O3RDXeuvpv3EZa5SjU2kpdwe15bctN1vxy04srsEEho237Fgr"
    //let consumerKey = "btovdEvP7usxU9re190M0c3Ih"
    //let apiBaseURL = URL(string: "https://api.twitter.com")
    
    static let sharedService = TwitterClientApi(baseURL: URL(string: "https://api.twitter.com"),
                                                consumerKey: "btovdEvP7usxU9re190M0c3Ih",
                                                consumerSecret: "5O3RDXeuvpv3EZa5SjU2kpdwe15bctN1vxy04srsEEho237Fgr")
    var loginSuccess: (()->())?
    var loginFailure: ((NSError)->())?
    
    var delegate: TwitterLoginDelegate?
    
    func login(_ success: @escaping ()->(), failure: @escaping (NSError) -> ()) {
        loginSuccess = success
        loginFailure = failure
        
        deauthorize()
        
        fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "simpletwitterclient://oauth")!, scope: nil, success: { (requestToken) in
            print("Got token")
            let url = URL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=" + (requestToken?.token)!)!
            UIApplication.shared.open(url)
            
        }) {(error) in
            print("error: \(String(describing: error?.localizedDescription))")
            self.loginFailure?(error! as NSError)
        }
    }
    
    func logout() {
        User.currentUser = nil
        deauthorize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: User.userDidLogoutNotification), object: nil)
    }
    
    func currentAccount(_ success: @escaping (User) -> (), failure: @escaping (NSError) -> ()) {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task, response) in
            let userDictionary = response as! NSDictionary
            let user = User(dictionary: userDictionary)
            success(user)
        }) { (task, error) in
            print("error: \(error.localizedDescription)")
            failure(error as NSError)
        }
    }
    
    func  handleOpenurl(_ url: URL) {
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let requestToken = BDBOAuth1Credential(queryString: url.query)!
        
        //Getting access token
        fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken) in
            self.currentAccount({ (user: User) in
                //Calling setter and saving user
                User.currentUser = user
                self.loginSuccess?()
                self.delegate?.continueLogin()
            }, failure: { (error) in
                self.loginFailure?(error)
            })
            self.loginSuccess?()
        }) { (error) in
            print("error: \(String(describing: error?.localizedDescription))")
            self.loginFailure?(error! as NSError)
        }
    }
}
