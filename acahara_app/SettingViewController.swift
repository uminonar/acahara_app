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
    @IBOutlet weak var settingBgImage: UIImageView!
    @IBOutlet weak var settingBgImageC: UIImageView!
    
    @IBAction func settingNameField(sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction func settingSentEmail(sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction func settingContEmail(sender: UITextField) {
        self.resignFirstResponder()
    }
    
   


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBgImage.image = UIImage(named: "bgImage.JPG")
        settingSelfee.image = UIImage(named:"selfee.JPG")

        
        let camera = FAKFontAwesome.cameraIconWithSize(30)
       camera.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightTextColor())
        let bgCameraImg = camera.imageWithSize(CGSizeMake(30, 30))
        settingBgImageC.image = bgCameraImg
        
        let selCamera = FAKFontAwesome.cameraIconWithSize(16)
        selCamera.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightTextColor())
        let selCameraImg = selCamera.imageWithSize(CGSizeMake(16, 16))
        settingSelgeeC.image = selCameraImg
        
        
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

