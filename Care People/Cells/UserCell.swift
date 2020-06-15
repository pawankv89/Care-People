//
//  UserCell.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//


import UIKit

class UserCell: UITableViewCell {
    
    static let identifier = "UserCell"
    
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconCodeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!

    //create your closure here
    var mapButtonPressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func mapButtonTap(_ sender: UIButton) {
        //Call your closure here
        mapButtonPressed()
    }
    
}
