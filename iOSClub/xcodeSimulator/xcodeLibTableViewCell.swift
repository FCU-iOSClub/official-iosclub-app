//
//  xcodeLibTableViewCell.swift
//  iOSClub
//
//  Created by 阿騰 on 2019/7/9.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class xcodeLibTableViewCell: UITableViewCell {
    @IBOutlet weak var mage: UIImageView!
    @IBOutlet weak var labtext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
