//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Jerry Lu on 7/3/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
}
