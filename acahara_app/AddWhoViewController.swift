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

    @IBOutlet weak var nameTextField: UITextField!
    
    var nameList = ["稲陰正彦教授","杉浦准教授","中村伊知哉教授"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nameList)
        // Do any additional setup after loading the view.
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
    
    //行を選択した時の処理
    //    func tableView (tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        print("\(indexPath.row)行目を選択")
    //
    //        var location = locLi
    //    st[indexPath.row]
    //        selectedLocation = location
    //
    //    }
    

    @IBAction func retrunName(sender: UITextField) {
        
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
