//
//  AddWhoViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/27.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AddWhoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    var setName:String = "セットできていません"
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var nameList = ["稲陰正彦教授","杉浦准教授","中村伊知哉教授"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        
//        履歴全件削除の設定 1回使ったらコメントアウト
//                var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
//                myDefault.removePersistentDomainForName(appDomain)
//        
        if(myDefault.objectForKey("nameList") != nil){
            //データを呼び出して
            nameList = myDefault.objectForKey("nameList") as! Array
        }
        print(nameList)
    }

    
    
    //行数を設定する
    
    func tableView (tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return nameList.count
        print(nameList.count)
    }
    
    //行の中身を設定する
    func tableView (tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "whoCell")
        
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色をグレーにする
        
        cell.textLabel?.textColor = UIColor.grayColor()
        
        
        var name = nameList[indexPath.row] as! String
        
        cell.textLabel?.text = "\(name)"
        
        return cell
    }
    
//    行を選択した時の処理
    func tableView (tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            print("\(indexPath.row)を選択")
    
            var name = nameList[indexPath.row]
        
            //ユーザーデフォルトを用意する
            var myDefault = NSUserDefaults.standardUserDefaults()
        
            //データを書き込んで
            myDefault.setObject(name, forKey: "selectedName")
        
            //即反映させる
            myDefault.synchronize()
        
            self.dismissViewControllerAnimated(true, completion: nil)
        
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var AddVC = segue.destinationViewController as! AddViewController
        
        AddVC.addName.text = setName
    }


 
    @IBAction func returnName(sender: AnyObject) {

        var name = nameTextField.text
        
        if name?.characters.count != 0{
            
            
            nameList.append(name!)
            
            print(nameList)
            
            //ユーザーデフォルトに保存
            //ユーザーデフォルトを用意する
            var myDefault = NSUserDefaults.standardUserDefaults()
            
            //データを書き込んで
            myDefault.setObject(nameList, forKey: "nameList")
            
            myDefault.setObject(name, forKey: "selectedName")
            
            //即反映させる
            myDefault.synchronize()
            
            
            //画面を閉じる機能がここでは効かない。なぜ？
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }

    }

    
    
    @IBAction func cancelBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
