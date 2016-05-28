//
//  AddWhereViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/27.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AddWhereViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedLocation = "where"

    @IBOutlet weak var placeTextFIeld: UITextField!

    
    var placeList = ["日吉協生館３階ミーティングルーム","日吉協生館委員長室","荻窪自宅"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var myDefault = NSUserDefaults.standardUserDefaults()
        
        
//履歴全件削除の設定 1回使ったらコメントアウト
//        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
//        myDefault.removePersistentDomainForName(appDomain)
        
        if(myDefault.objectForKey("placeList") != nil){
            //データを呼び出して
            placeList = myDefault.objectForKey("placeList") as! Array
        }
        print(placeList)
    }

    //行数を設定する
    
    func tableView (tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return placeList.count
    }
    
    
    //行の中身を設定する
    func tableView (tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "whereCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.grayColor()
        
        
        var place = placeList[indexPath.row] as! String
        
        cell.textLabel?.text = "\(place)"
        
        return cell
    }
    
    //行を選択した時の処理
    //    func tableView (tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        print("\(indexPath.row)行目を選択")
    //
    //        var location = locLi
    //    st[indexPath.row]
    //        selectedLocation = location
    //
    //    }
    
    
    @IBAction func locTextField(sender: UITextField) {

        var tmpStr = placeTextFIeld.text

        if tmpStr?.characters.count != 0{
        
        placeList.append(tmpStr!)
        
        print(placeList)
        
        //ユーザーデフォルトに保存
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(placeList, forKey: "placeList")
        
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
