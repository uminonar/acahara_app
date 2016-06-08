//
//  AssistTableViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AssistTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate,UITextFieldDelegate {

    var expandflag = false
    var rownumber = 3

    
    var mailContent = Dictionary<String,String>()

    
    @IBOutlet weak var assistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assistTableView.registerNib(UINib(nibName: "assistInfoCell", bundle: nil), forCellReuseIdentifier: "assistInfoCell")
        
        assistTableView.registerNib(UINib(nibName: "assistInfoDetailCell", bundle: nil), forCellReuseIdentifier: "assistInfoDetailCell")
        
        assistTableView.registerNib(UINib(nibName: "assistChoseAdvisorCell", bundle: nil), forCellReuseIdentifier: "assistChoseAdvisorCell")
        
        assistTableView.registerNib(UINib(nibName: "assistChosePostsCell", bundle: nil), forCellReuseIdentifier: "assistChosePostsCell")
        
        //テーブルビューの罫線を消す
        assistTableView.separatorColor = UIColor.clearColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("mailContents", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        let jsonDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsondata!,options:[])) as! NSDictionary
        
        for (key, data) in jsonDictionary {
            mailContent[key as! String] = data as! String
        }
    
    }
    
    
    
    //行数決定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rownumber
    }
    
    //表示内容を決定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell: UITableViewCell
        
        
        if indexPath.row == 0{
            
            //cellを生成？
            var cell:assistInfoTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistInfoCell", forIndexPath: indexPath) as! assistInfoTableViewCell
            
            
            return cell
            
            
        
        }
        
        
        
        if indexPath.row == 1{
            
            //cellを生成？
            var cell:assistChoseAdvisorTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChoseAdvisorCell", forIndexPath: indexPath) as! assistChoseAdvisorTableViewCell
            
            
            return cell
            
        }
        
        if indexPath.row == 2 {
            
            var cell:assistChosePostsTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChosePostsCell", forIndexPath: indexPath) as! assistChosePostsTableViewCell
            
            
            return cell
        }
        
    
//            if expandflag {
//                
//                var cell:assistInfoDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistInfoDetailCell", forIndexPath: indexPath) as! assistInfoDetailTableViewCell
//                
//                return cell
//                
//            }else{
//                
//                var cell:assistChoseAdvisorTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChoseAdvisorCell", forIndexPath: indexPath) as! assistChoseAdvisorTableViewCell
//                
//                
//               //これはいる？
////                cell.assistMailContent.delegate = self
//                
//                
//                
//                var myDefault = NSUserDefaults.standardUserDefaults()
//                var editedText = myDefault.objectForKey("")
//                if(editedText != nil){
////                    cell.assistMailContent.text = editedText
//                    
//                    //TODO:編集ページで保存されたらeditedTextを更新する処理をして
//                    //TODO:キャンセルと保存の時に必ずnilに戻して
//                    
//                //
//                
//                    var advisor = myDefault.stringForKey("selectedAdvisor")
//                    if(advisor != nil){
//                        var mContent = mailContent[advisor!] as! String?
//                        cell.assistMailContent.text = mContent
//                    }
//                
//                    
//            
//                
//                
//                    // tap gesture recognizer をassistMailContentのTextViewに設置
//                    let tap = UITapGestureRecognizer(target: self, action:"setMailContent:")
//                    //                tap.delegate = self
//                    cell.assistMailContent.addGestureRecognizer(tap)
//                
//                
//                
//                
//                    //各Advisorのボタンがタップされた時の処理
//                    //：をつけることで、sender情報を使える
//                    cell.professor.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 100//professor
//                    
//                    cell.assailant.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 200//assailant
//                    
//                    cell.committee.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 300//committee
//                    
//                    cell.psycotherapist.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 400//psychotherapist
//                    
//                    cell.lawyer.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 500//lawyer
//                    
//                    cell.friend.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
//                    cell.professor.tag = 600//friend
//                    
//                    return cell
//                    
//                
//                }
//                
//                return cell
//                
//
//            }
//            
//        }
        
        
        var emptycell:UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        
        return emptycell
    }
    
    
    func insesender(sender:UIButton){
       print(sender.tag)//tagはIntしか入れられない
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        if sender.tag == 100{
            myDefault.setObject("professor", forKey: "selectedAdvisor")
        }

        if sender.tag == 200{
            myDefault.setObject("assailant", forKey: "selectedAdvisor")
        }
        if sender.tag == 300{
            myDefault.setObject("committee", forKey: "selectedAdvisor")
        }

        if sender.tag == 400{
            myDefault.setObject("psycotherapist", forKey: "selectedAdvisor")
        }
            
        if sender.tag == 500{
            myDefault.setObject("lawyer", forKey: "selectedAdvisor")
        }
        
        if sender.tag == 600{
            myDefault.setObject("friend", forKey: "selectedAdvisor")
        }
        
        myDefault.synchronize()
        

 
        
        //TODO:ここをassistChoseAdvisorCellの行だけリロードしたい。どうする？
        assistTableView.reloadData()
    
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 55
        }
        if indexPath.row == 1 {
            return 386
        }
        if indexPath.row == 2 {
            return 150
        }
        
        return 80.0//ここの意味は？
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