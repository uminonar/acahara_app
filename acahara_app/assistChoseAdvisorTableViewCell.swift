//
//  assistChoseAdviserTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class assistChoseAdvisorTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var assistComments: UIImageView!
    
    @IBOutlet weak var professor: UIButton!
    @IBOutlet weak var assailant: UIButton!
    @IBOutlet weak var committee: UIButton!
    @IBOutlet weak var psycotherapist: UIButton!
    @IBOutlet weak var lawyer: UIButton!
    @IBOutlet weak var friend: UIButton!

    @IBOutlet weak var assistMailContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let comments = FAKFontAwesome.commentsOIconWithSize(15)
        let commentsImage = comments.imageWithSize(CGSizeMake(15, 15))
        assistComments.image = commentsImage
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
