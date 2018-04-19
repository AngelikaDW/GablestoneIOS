//
//  TourTableViewCell.swift
//  GablestoneIOS
//
//  Created by AngelikaDW on 19/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit

class TourTableViewCell: UITableViewCell {

    @IBOutlet var stoneImage: UIImageView!
    
    @IBOutlet weak var stoneName: UILabel!
    
    @IBOutlet weak var stoneAddress: UILabel!
    
    @IBOutlet weak var stoneCheckMark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
