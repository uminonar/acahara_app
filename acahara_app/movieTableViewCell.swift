//
//  movieTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/29.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class movieTableViewCell: UITableViewCell {

    @IBOutlet weak var playBtn: UIImageView!
    @IBOutlet weak var movieView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let sakuraPale:UIColor = UIColor(red:1.0,green:0.953,blue:0.910,alpha:1.0)
        
        self.backgroundColor = sakuraPale
        
        playBtn.image = UIImage(named:"playBtn")?.imageWithRenderingMode(.AlwaysTemplate)
        
        let lucentWhite :UIColor = UIColor(red:0.0,green:0.0,blue:0.0,alpha:0.7)
        
        playBtn.tintColor = lucentWhite

        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
