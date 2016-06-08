//
//  assistInfoTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class assistInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var assistInfo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let info = FAKFontAwesome.infoIconWithSize(15)
        let infoImage = info.imageWithSize(CGSizeMake(15, 15))
        assistInfo.image = infoImage
        
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
