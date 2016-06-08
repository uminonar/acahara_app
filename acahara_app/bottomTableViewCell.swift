//
//  bottomTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/06.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class bottomTableViewCell: UITableViewCell {

    @IBOutlet weak var addWhere: UITextField!
    @IBOutlet weak var addWho: UITextField!
    @IBOutlet weak var addDiary: UITextView!
    @IBOutlet weak var addUniversity: UITextField!

    @IBOutlet weak var addPicPlus: UIImageView!
    @IBOutlet weak var addPicFile: UIImageView!
    @IBOutlet weak var addMoviePlus: UIImageView!
    @IBOutlet weak var addMovieFile: UIImageView!
    @IBOutlet weak var addMicPlus: UIImageView!
    @IBOutlet weak var addMicPhone: UIImageView!
    @IBOutlet weak var addImportance: UILabel!
    
    @IBOutlet weak var picBase: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // addDiaryのTextViewに枠をつける。
        addDiary.layer.borderWidth = 0.5
        
        // 枠の色を設定する。
        addDiary.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 枠の角を丸くする。
        addDiary.layer.cornerRadius = 8
        
        let plus = FAKFontAwesome.plusIconWithSize(15)
        plus.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let plusImage = plus.imageWithSize(CGSizeMake(15, 15))
        addMicPlus.image = plusImage
        
        let mike = FAKFontAwesome.microphoneIconWithSize(25)
        mike.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let mikeImg = mike.imageWithSize(CGSizeMake(25, 25))
        addMicPhone.image = mikeImg
        
        let plus2 = FAKFontAwesome.plusIconWithSize(25)
        plus2.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let plus2Img = plus2.imageWithSize(CGSizeMake(25, 25))
        addPicPlus.image = plus2Img
        
        let addImage = FAKFontAwesome.fileImageOIconWithSize(50)
        addImage.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let addI = addImage.imageWithSize(CGSizeMake(50, 50))
        addPicFile.image = addI
        
        let plus3 = FAKFontAwesome.plusIconWithSize(25)
        let plus3Img = plus3.imageWithSize(CGSizeMake(25, 25))
        addMoviePlus.image = plus2Img
        
        let addMo = FAKFontAwesome.fileMovieOIconWithSize(50)
        addMo.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let addM = addMo.imageWithSize(CGSizeMake(50, 50))
        addMovieFile.image = addM
        
        
 
    }


    @IBOutlet weak var addSwitch: UISwitch!
    @IBOutlet weak var picFileBtn: UIButton!
    @IBOutlet weak var movieFileBtn: UIButton!
    @IBOutlet weak var tapSound: UIButton!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
