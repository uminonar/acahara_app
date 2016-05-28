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

    @IBOutlet weak var locationTextField: UITextField!
    
    var locList = ["日吉共生館３階ミーティングルーム","日吉共生館委員長室","荻窪自宅"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var myDefault = NSUserDefaults.standardUserDefaults()
        
        if(myDefault.objectForKey("locationList") != nil){
            //データを呼び出して
            locList = myDefault.objectForKey("locationList") as! Array
        }
        print(locList)
    }

    @IBAction func locTextField(sender: UITextField) {
        
        locList.append(sender.text!)
        
        print(locList)
        
        //ユーザーデフォルトに保存
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(locList, forKey: "locationList")
        
        //即反映させる
        myDefault.synchronize()

        
    }
    
    //行数を設定する
    
    func tableView (tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return locList.count
    }
    
    
    //行の中身を設定する
    func tableView (tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "whereCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
//        cell.textLabel?.textColor = UIColor.brownColor()
        
        
        var location = locList[indexPath.row] as! String
        
        cell.textLabel?.text = "\(location)"
        
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
