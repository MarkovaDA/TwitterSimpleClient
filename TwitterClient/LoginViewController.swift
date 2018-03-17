//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Darya Markova on 16.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var btnViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnViewContainer.layer.cornerRadius = 5;
        btnViewContainer.alpha = 0;
        titleLabel.alpha = 0;
        UIApplication.shared.statusBarStyle = .lightContent;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded();
            self.btnViewContainer.alpha = 1;
            self.titleLabel.alpha = 1;
        }
    }
    
    @IBAction func onLoginBtnClick(_ sender: UIButton) {
        
    }
}
