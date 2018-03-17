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
        self.goToLogin();
    }
    
    func goToLogin() {
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
}
