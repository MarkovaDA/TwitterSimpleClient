//
//  HomeViewController.swift
//  TwitterClient
//
//  Created by Darya Markova on 18.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let users = ["Darya", "Ksenya", "Nastya", "Olga"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*строк в таблице*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as! TweetCellViewController;
        cell.usernameLabel.text = users[indexPath.row];
        return (cell)
    }
    
    /*@IBAction func onBtnLogOutClick(_ sender: UIButton) {
        TwitterClientApi.sharedService?.logout()
    }*/
}
