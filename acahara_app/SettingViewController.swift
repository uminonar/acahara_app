//
//  SecondViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {



    @IBOutlet weak var saveBtn: UIImageView!
    @IBOutlet weak var settingMenu: UIImageView!
    @IBOutlet weak var menuCoverBtn: UIButton!
    
    @IBOutlet weak var settingSelfee: UIImageView!
    @IBOutlet weak var settingSelgeeC: UIImageView!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmEmailField: UITextField!
    @IBOutlet weak var contactEmailField: UITextField!


    
    @IBAction func settingNameField(sender: UITextField) {
        self.resignFirstResponder()
        
        //ユーザーデフォルトに保存
        //ユーザーデフォルトを用意する
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "setName")

        //即反映させる
        myDefault.synchronize()
    }
    
    @IBAction func settingSentEmail(sender: UITextField) {
        self.resignFirstResponder()
        
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "setEmail")
        
        //即反映させる
        myDefault.synchronize()
    }
    
    @IBAction func confirmSentEmail(sender: UITextField) {
         self.resignFirstResponder()
        
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "setConfEmail")
        
        //即反映させる
        myDefault.synchronize()
    }
    @IBAction func settingContEmail(sender: UITextField) {
        self.resignFirstResponder()
        
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "setContEmail")
        
        //即反映させる
        myDefault.synchronize()
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
        
        saveBtn.image = UIImage(named:"dataBase")?.imageWithRenderingMode(.AlwaysTemplate)
        
        let sakura:UIColor = UIColor(red:1.0,green:0.3,blue:0.3,alpha:1.0)
        saveBtn.tintColor = UIColor.whiteColor()


//        let times = FAKFontAwesome.timesIconWithSize(25)
//        
//        let timesImage = times.imageWithSize(CGSizeMake(25, 25))
//        
//        cancelBtn.setImage(timesImage, forState: .Normal)
        
//        let bars = FAKFontAwesome.barsIconWithSize(20)
//        //下記でアイコンの色も変えられます
////        bars.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
//        
//        let barsImage = bars.imageWithSize(CGSizeMake(20, 20))
//        
//        settingBars.setImage(barsImage, forState: .Normal)
//        
//        self.settingBars.addTarget(SSASideMenu(), action: Selector("presentLeftMenuViewController"), forControlEvents: UIControlEvents.TouchUpInside)
        
        //sideBar向け
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        settingMenu.image = UIImage(named:"menu")?.imageWithRenderingMode(.AlwaysTemplate)

        
        
        settingMenu.tintColor = UIColor.whiteColor()
        
        self.menuCoverBtn.addTarget(SSASideMenu(), action: Selector("presentLeftMenuViewController"), forControlEvents: UIControlEvents.TouchUpInside)

        
        //既に設定されている内容があれば各フォームに記入
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        var setName = myDefault.stringForKey("setName")
        if ( setName != nil){
            nameField.text = setName
            nameField.textColor = UIColor.darkGrayColor()
        }
        
        var email = myDefault.stringForKey("setEmail")
        if ( email != nil){
            emailField.text = email
            nameField.textColor = UIColor.darkGrayColor()
        }
        
        var confEmail = myDefault.stringForKey("setConfEmail")
        if ( confEmail != nil){
            confirmEmailField.text = confEmail
            nameField.textColor = UIColor.darkGrayColor()
        }
        
        var contactEmail = myDefault.stringForKey("setContEmail")
        if ( contactEmail != nil){
            contactEmailField.text = contactEmail
            nameField.textColor = UIColor.darkGrayColor()
        }
    
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

