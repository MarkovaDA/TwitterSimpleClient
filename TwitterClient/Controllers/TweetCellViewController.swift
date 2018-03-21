//
//  TweetCellViewController.swift
//  TwitterClient
//
//  Created by Darya Markova on 21.03.2018.
//  Copyright © 2018 Darya Markova. All rights reserved.
//

import UIKit

class TweetCellViewController: UITableViewCell {

    @IBOutlet weak var userPreview: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
