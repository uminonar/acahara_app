//
//  SecondViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {


    @IBOutlet weak var settingSelfee: UIImageView!
    @IBOutlet weak var settingSelgeeC: UIImageView!

    @IBOutlet weak var saveBtn: UIButton!

    @IBOutlet weak var cancelBtn: UIButton!

    
    @IBAction func settingNameField(sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction func settingSentEmail(sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction func confirmSentEmail(sender: UITextField) {
         self.resignFirstResponder()
    }
    @IBAction func settingContEmail(sender: UITextField) {
        self.resignFirstResponder()
    }
    
   


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingSelfee.image = UIImage(named:"selfee.JPG")
        
        let selCamera = FAKFontAwesome.cameraIconWithSize(16)
        selCamera.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightTextColor())
        let selCameraImg = selCamera.imageWithSize(CGSizeMake(16, 16))
        settingSelgeeC.image = selCameraImg
        
        let save = FAKFontAwesome.hddOIconWithSize(25)
        
        let saveImage = save.imageWithSize(CGSizeMake(25, 25))
        
        saveBtn.setImage(saveImage, forState: .Normal)

        let times = FAKFontAwesome.timesIconWithSize(25)
        
        let timesImage = times.imageWithSize(CGSizeMake(25, 25))
        
        cancelBtn.setImage(timesImage, forState: .Normal)
        
        
        
    }

    @IBAction func bgImageCBtn(sender: UIButton) {
        
        //画像選択をして、それをbgimageと取り替える
        
    }
       @IBAction func selfeeCBtn(sender: UIButton) {
        
        //画像選択をして、それをselfeeimageと取り替える
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

