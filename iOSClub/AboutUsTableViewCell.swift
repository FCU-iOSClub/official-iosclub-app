//
//  AboutUsTableViewCell.swift
//  iOSClub
//
//  Created by Admin02 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import UIKit

class AboutUsTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var introduce: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
