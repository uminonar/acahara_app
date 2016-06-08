//
//  assistChosePostsTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class assistChosePostsTableViewCell: UITableViewCell {
    @IBOutlet weak var assistEye: UIImageView!

    @IBOutlet weak var assistQsentenceBtn: UIButton!
    @IBOutlet weak var assistQmarkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let eye = FAKFontAwesome.eyeIconWithSize(15)
        let eyeImage = eye.imageWithSize(CGSizeMake(15, 15))
        assistEye.image = eyeImage
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
