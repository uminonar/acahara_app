//
//  AddViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/27.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    
    @IBOutlet weak var addBar: UIView!
    @IBOutlet weak var addSelfee: UIImageView!
    @IBOutlet weak var addName: UILabel!
    @IBOutlet weak var addWhen: UITextField!

    @IBOutlet weak var dateBaseView: UIView!
    @IBOutlet weak var addDateTime: UIView!
    @IBOutlet weak var addDatePicker: UIView!
    
    @IBOutlet weak var addMoveView: UIView!
    @IBOutlet weak var addWhere: UITextField!
    @IBOutlet weak var addWho: UITextField!
    @IBOutlet weak var addUniversity: UITextField!

    @IBOutlet weak var addImportance: UILabel!
    @IBOutlet weak var addDiary: UITextView!
    
    @IBOutlet weak var addMicPlus: UIImageView!
    @IBOutlet weak var addMicPhone: UIImageView!

    @IBOutlet weak var addPicPlus: UIImageView!
    @IBOutlet weak var addPicFile: UIImageView!

    @IBOutlet weak var addMoviePlus: UIImageView!
    @IBOutlet weak var addMovieFile: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        //色が変わらない！！！なぜ？
        let plus = FAKFontAwesome.plusIconWithSize(15)
        let plusImage = plus.imageWithSize(CGSizeMake(15, 15))
        addMicPlus.image = plusImage
        
        let mike = FAKFontAwesome.microphoneIconWithSize(25)
        let mikeImg = mike.imageWithSize(CGSizeMake(25, 25))
        addMicPhone.image = mikeImg
        
        let plus2 = FAKFontAwesome.plusIconWithSize(25)
        let plus2Img = plus2.imageWithSize(CGSizeMake(25, 25))
        addPicPlus.image = plus2Img
        
        let addImage = FAKFontAwesome.fileImageOIconWithSize(50)
        let addI = addImage.imageWithSize(CGSizeMake(50, 50))
        addPicFile.image = addI
        
        let plus3 = FAKFontAwesome.plusIconWithSize(25)
        let plus3Img = plus3.imageWithSize(CGSizeMake(25, 25))
        addMoviePlus.image = plus2Img
        
        let addMo = FAKFontAwesome.fileMovieOIconWithSize(50)
        let addM = addMo.imageWithSize(CGSizeMake(50, 50))
        addMovieFile.image = addM
        
        // コメントのTextViewに枠をつける。
        addTextView.layer.borderWidth = 0.5
        
        // 枠の色を設定する。
        addTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 枠の角を丸くする。
        addTextView.layer.cornerRadius = 8
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        addName.text = add["name"]
        addSelfee.image = UIImage(named: "portrait1.JPG")
        //        bottomView.frame = CGRectMake(0, myBoundSize.height-428, 320, 428)
        
        
        
        //ユーザーデフォルトから保存されたデータを取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを呼び出して
        var myStr = myDefault.stringForKey("uString")
        
        //文字列が入っていたら、表示する
        print(myStr)
        addUniversity.text = myStr

        
    }

    @IBAction func addSwitch(sender: UISwitch) {
        if sender.on == true { //== trueはなくても良い
            importance.text = "重要"
        }else{
            importance.text = "通常"
    }
    }
    
    func textfieldShouldBeginEditing(textField: UITextField) -> Bool {
        print(textField.tag)
        print("addwhen")
        
        if textField.tag == 1000{
            UIView.animateWithDuration(1, animations: { () -> Void in self.addMoveView.frame = CGRectMake(0,333, self.myBoundSize.width, 428)
                }, completion: { finished in print("addMoveViewを動かした")
            })
            return false
        }
        
        if textField.tag == 2000{
            let addWhere = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addWhereViewController") as UIViewController
            
            presentViewController(addWhere, animated: true, completion: nil)
            return false
        }
        
        if textField.tag == 3000{
            let addWhere = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addWhoViewController") as UIViewController
            
            presentViewController(addWhere, animated: true, completion: nil)
            
            return false
        }
        
        if textField.tag == 4000{
            //ユーザーデフォルトを用意する
            var myDefault = NSUserDefaults.standardUserDefaults()
            
            //データを書き込んで
            myDefault.setObject(sender.text, forKey: "uString")
            
            //即反映させる
            myDefault.synchronize()
            
        }
        
        
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
