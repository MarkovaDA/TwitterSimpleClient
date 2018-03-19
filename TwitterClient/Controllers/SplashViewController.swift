//
//  SplashViewController.swift
//  TwitterClient
//
//  Created by Darya Markova on 16.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, TwitterLoginDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClientApi.sharedService?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        continueLogin()
    }
    
    func continueLogin() {
        //если пользователь не авторизован
        if (User.currentUser == nil) {
            self.goToLogin();
        } else {
            self.goToApp()
        }
    }
    
    func goToApp() {
        self.performSegue(withIdentifier: "TabTapeedViewSegue", sender: self)
    }
    
    func goToLogin() {
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
}
