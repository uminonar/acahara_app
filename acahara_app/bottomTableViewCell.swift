//
//  bottomTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/06.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class bottomTableViewCell: UITableViewCell {

  

    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var picCancelBtn: UIButton!
    @IBOutlet weak var addWhere: UITextField!
    @IBOutlet weak var addWho: UITextField!
    @IBOutlet weak var addDiary: UITextView!
    @IBOutlet weak var addUniversity: UITextField!

    @IBOutlet weak var addCameraImage: UIImageView!
    @IBOutlet weak var addVideoImage: UIImageView!
   

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
        
        
        

   
        

        
        
        let addImage = FAKFontAwesome.cameraIconWithSize(50)
        addImage.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let addI = addImage.imageWithSize(CGSizeMake(50, 50))
        addCameraImage.image = addI
        
        
        let addMo = FAKFontAwesome.videoCameraIconWithSize(50)
        addMo.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        let addM = addMo.imageWithSize(CGSizeMake(50, 50))
        addVideoImage.image = addM
        
        let times = FAKFontAwesome.timesIconWithSize(20)
        //下記でアイコンの色も変えられます
        times.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        
        let timesImage = times.imageWithSize(CGSizeMake(20, 20))
        
        picCancelBtn.setImage(timesImage, forState: .Normal)
    }


    @IBOutlet weak var addSwitch: UISwitch!
    @IBOutlet weak var picFileBtn: UIButton!
    @IBOutlet weak var movieFileBtn: UIButton!
  

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
