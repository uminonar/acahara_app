//
//  SecondViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit
import MobileCoreServices
//import AssetsLibrary
import Photos
import AVFoundation

class SettingViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,QBImagePickerControllerDelegate {

    var myApp = UIApplication.sharedApplication()
        .delegate as! AppDelegate
    
    var json:NSData!
    
    @IBOutlet weak var saveBtn: UIImageView!
    @IBOutlet weak var settingMenu: UIImageView!
    @IBOutlet weak var menuCoverBtn: UIButton!
    
    @IBOutlet weak var settingSelfee: UIImageView!
    @IBOutlet weak var settingSelgeeC: UIImageView!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmEmailField: UITextField!
    @IBOutlet weak var contactEmailField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //selfee画像をセットする。デフォルトにあればそちらを、なければ、初期のselfee.JPGをセットする。
    
        var myDefault = NSUserDefaults.standardUserDefaults()
        var urlStr = myDefault.stringForKey("selfeeURL")
        
        if urlStr != nil{
            
            var url = NSURL(string: urlStr!)

            let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([url!], options: nil)
            
            if fetchResult.firstObject != nil{
                
                let asset: PHAsset = fetchResult.firstObject as! PHAsset
                
                // print("pixelWidth:\(asset.pixelWidth)");
                // print("pixelHeight:\(asset.pixelHeight)");

                let manager: PHImageManager = PHImageManager()
                manager.requestImageForAsset(asset,targetSize: CGSizeMake(5, 500),contentMode: .AspectFit,options: nil) { (image, info) -> Void in
                    
                //imageViewのaspectFitをつける必要がある？このままで良いかも
                self.settingSelfee.image = image

                }
            }
            
        }else{
            
            settingSelfee.image = UIImage(named:"selfee.JPG")
            
        }
        
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
    

    
    @IBAction func settingNameField(sender: UITextField) {
        self.resignFirstResponder()
        
        //ユーザーデフォルトに保存
        //ユーザーデフォルトを用意する
        let myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "setName")
        
        //appDelegateに書き込まれているuserNameを上書き
        myApp.userName = sender.text!


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
    
   

    
    

    @IBAction func selfeeCBtn(sender: UIButton) {
        
        //画像選択をして、それをselfeeimageと取り替える
        
        let picker = QBImagePickerController()
        picker.delegate = self
        
        
        //ここを写真だけ選択可能にしたい。falseにしても変わらない。どうすれば？
        picker.allowsMultipleSelection = true;
        
        
        //選択可能枚数最大1枚
        picker.maximumNumberOfSelection = 1;
        
        picker.assetCollectionSubtypes = [
            PHAssetCollectionSubtype.SmartAlbumUserLibrary.rawValue,
            PHAssetCollectionSubtype.AlbumMyPhotoStream.rawValue
        ];
        
        
        //MARK: 写真のみ選択 (ImageをVideoで動画選択)
        picker.mediaType = QBImagePickerMediaType.Image
        
        presentViewController(picker, animated: true, completion: nil)

    }
    
    
    func qb_imagePickerController(imagePickerController: QBImagePickerController, didFinishPickingAssets assets: [AnyObject]) {

        var selectedPicture = assets as! PHAsset
        
        //URL取得の場合
        print(selectedPicture.description)
        
        let divideURL = selectedPicture.description.componentsSeparatedByString("=")
        let arrayURL = divideURL[1].componentsSeparatedByString("/")
        var mediaType = arrayURL[0]
        
        //配列にして入れる関数 asset_each.descriptionをpoした場合に、ある情報を３つの配列に分ける。
        let urlArray = selectedPicture.description.componentsSeparatedByString("/")
        
        let urlArray2 = urlArray[0].componentsSeparatedByString(" ")
        
        //            photoURLArray.append("assets-library://asset/asset.JPG?id="+urlArray2[2]+"&ext=JPG")
        
        let assetURL = "assets-library://asset/asset.JPG?id="+urlArray2[2]+"&ext=JPG"
        print(assetURL)
        
        //ここのプロセスあってる？
        var url = NSURL(string: assetURL as! String)
        
        let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([url!], options: nil)
        
        if fetchResult.firstObject != nil{

            let asset: PHAsset = fetchResult.firstObject as! PHAsset
            
            // print("pixelWidth:\(asset.pixelWidth)");
            // print("pixelHeight:\(asset.pixelHeight)");
            
            
            let manager: PHImageManager = PHImageManager()
            manager.requestImageForAsset(asset,targetSize: CGSizeMake(5, 500),contentMode: .AspectFit,options: nil) { (image, info) -> Void in
                
                //imageViewのaspectFitをつける必要がある？このままで良いかも
                 self.settingSelfee.image = image
            }
        }


            //UserDefaultに配列を保存
            var myDefault = NSUserDefaults.standardUserDefaults()
            myDefault.setObject(assetURL, forKey: "selfeeURL")
  
            myDefault.synchronize()
        
        
            //選択されたselfee画像をサーバーに送る
            
        }
    
    
    


    @IBAction func tapSave(sender: UIButton) {
        
        // まずPOSTで送信したい情報をセット
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        var setName = myDefault.stringForKey("setName")
        var setEmail = myDefault.stringForKey("setEmail")
        var confirmEmail = myDefault.stringForKey("setConfEmail")
        var contactEmail = myDefault.stringForKey("setContEmail")
        var selfee = myDefault.stringForKey("selfeeURL")
        
        
        
        // dictionaryで送信するJSONデータを生成.
        var myDict:NSMutableDictionary = NSMutableDictionary()
        
        let userName = setName!.dataUsingEncoding(NSUTF8StringEncoding)
        let sentToEmail = setEmail!.dataUsingEncoding(NSUTF8StringEncoding)
        let confirmMail = confirmEmail!.dataUsingEncoding(NSUTF8StringEncoding)
        let contactMail = contactEmail!.dataUsingEncoding(NSUTF8StringEncoding)
        let selfeeURL = selfee!.dataUsingEncoding(NSUTF8StringEncoding)

        
        
        // 作成したdictionaryがJSONに変換可能かチェック.
        if NSJSONSerialization.isValidJSONObject(myDict){
            
            // DictionaryからJSON(NSData)へ変換.
            
            do {
                json = try NSJSONSerialization.dataWithJSONObject(myDict, options: NSJSONWritingOptions.PrettyPrinted) as NSData
                // here "jsonData" is the dictionary encoded in JSON data
                // 生成したJSONデータの確認.
                print(NSString(data: json, encoding: NSUTF8StringEncoding)!)
                
            } catch let error as NSError {
                print(error)
            }
            catch{
                print("Unknown Error")
            }

        }
        
        
        
        //                do {
        //                    let decoded = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [String:String]
        //                    // here "decoded" is the dictionary decoded from JSON data
        //                } catch let error as NSError {
        //                    print(error)
        //                }
        
        
        // Http通信のリクエスト生成.
        
        var url = NSURL(string: "http://acahara-kill-app.sakuca.ne.jp/user.php")
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        var req = NSMutableURLRequest(URL: url!)
        req.HTTPMethod = "POST"
        // jsonのデータを一度文字列にして、キーと合わせる.
        var myData:NSString = "json=\(NSString(data: json, encoding: NSUTF8StringEncoding)!)"
        
        // jsonデータのセット.
        req.HTTPBody = myData.dataUsingEncoding(NSUTF8StringEncoding)
        
        var task = session.dataTaskWithRequest(req, completionHandler: {
            (data, resp, err) in
            print(resp!.URL!)
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        })
        task.resume()
    }
    

    
    
    
    




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

