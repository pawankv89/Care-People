//
//  NeedCell.swift
//  Care People
//
//  Created by Pawan kumar on 13/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit

class NeedCell: UITableViewCell {
    
    static let identifier = "NeedCell"
    
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
