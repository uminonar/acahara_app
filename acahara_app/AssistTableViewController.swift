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
    
    var posts:NSMutableArray = []
    
    @IBOutlet weak var send: UIImageView!



    
    var mailContent = Dictionary<String,String>()

    
    @IBOutlet weak var assistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assistTableView.registerNib(UINib(nibName: "assistInfoCell", bundle: nil), forCellReuseIdentifier: "assistInfoCell")
        
        assistTableView.registerNib(UINib(nibName: "assistInfoDetailCell", bundle: nil), forCellReuseIdentifier: "assistInfoDetailCell")
        
        assistTableView.registerNib(UINib(nibName: "assistChoseAdvisorCell", bundle: nil), forCellReuseIdentifier: "assistChoseAdvisorCell")
        
        assistTableView.registerNib(UINib(nibName: "assistChosePostsCell", bundle: nil), forCellReuseIdentifier: "assistChosePostsCell")
        
        assistTableView.registerNib(UINib(nibName: "choseCustomCell", bundle: nil), forCellReuseIdentifier: "choseCustomCell")
        
        //テーブルビューの罫線を消す
//        assistTableView.separatorColor = UIColor.clearColor()
        assistTableView.separatorInset = UIEdgeInsetsZero
       
        
        
        //飛行機、決定送信
//        let send = FAKFontAwesome.paperPlaneIconWithSize(20)
//        let sakura:UIColor = UIColor(red:1.0,green:0.4,blue:0.4,alpha:1.0)
//        send.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
//        let sendImage = send.imageWithSize(CGSizeMake(20, 20))
//        sendBtn.setImage(sendImage, forState: .Normal)
//        
        send.image = UIImage(named:"send")?.imageWithRenderingMode(.AlwaysTemplate)
        
        send.tintColor = UIColor.whiteColor()

        
        
    }
    
    

    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("mailContents", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        let jsonDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsondata!,options:[])) as! NSDictionary
        
        for (key, data) in jsonDictionary {
            
            mailContent[key as! String] = data as! String
        }
        
        
        
        
        //選択する記録を表示するためのデータを取得してpostsに収める
        let pathpost = NSBundle.mainBundle().pathForResource("posts", ofType: "txt")
        let jsondatapost = NSData(contentsOfFile: pathpost!)
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondatapost!, options: [])) as! NSArray
        
        for data in jsonArray{
            
            //openFlag=0のものだけここのpostsには収めたい。どうする？
            var openFlag = data["openFlag"] as! String
            if (openFlag == "0"){
                
                
                var postEach:NSMutableDictionary = data.mutableCopy() as! NSMutableDictionary
                postEach["selectedFlag"] = false
                
                posts.addObject(postEach)
            }
        }

    
    }
    
    
    
    //行数決定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rownumber + posts.count
    }
    
    //表示内容を決定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell: UITableViewCell
        
        
        if indexPath.row == 0{
            
            //cellを生成？
            var cell:assistInfoTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistInfoCell", forIndexPath: indexPath) as! assistInfoTableViewCell
            
            if expandflag{
                
                cell.assistInfo.image = UIImage(named: "info")?.imageWithRenderingMode(.AlwaysTemplate)
                cell.assistInfo.tintColor = UIColor.blueColor()
                cell.assistInfoS.textColor = UIColor.blueColor()

            }else{
                
                cell.assistInfo.image = UIImage(named: "info")?.imageWithRenderingMode(.AlwaysTemplate)
                cell.assistInfo.tintColor = UIColor.blackColor()
                cell.assistInfoS.textColor = UIColor.blackColor()
            }

            
            let HiddenSeparatorInset: UIEdgeInsets = UIEdgeInsetsMake(0, CGFloat(UInt16.max), 0, 0)
            cell.separatorInset = HiddenSeparatorInset
            return cell
            
        }
        
        var adjustrow_no = indexPath.row
        
        if expandflag{
            if indexPath.row == 1{

                
            var cell:assistInfoDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistInfoDetailCell", forIndexPath: indexPath) as! assistInfoDetailTableViewCell
                
                let HiddenSeparatorInset: UIEdgeInsets = UIEdgeInsetsMake(0, CGFloat(UInt16.max), 0, 0)
                cell.separatorInset = HiddenSeparatorInset
            return cell

            }
        
            adjustrow_no--
        }
            
    
        
        if adjustrow_no == 1{
            
            //cellを生成？
            var cell:assistChoseAdvisorTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChoseAdvisorCell", forIndexPath: indexPath) as! assistChoseAdvisorTableViewCell
            
//                           これいる？ cell.assistMailContent.delegate = self
            
        
            
                           var myDefault = NSUserDefaults.standardUserDefaults()
                            var editedText = myDefault.objectForKey("mailContent")
                                if(editedText != nil){
                                cell.assistMailContent.text = editedText as! String
                                }
            
                            //TODO:編集ページで保存されたらeditedTextを更新する処理をして
                            //TODO:キャンセルと保存の時に必ずnilに戻して

            
                            var advisor = myDefault.stringForKey("selectedAdvisor")
                                if(advisor != nil){
                                    var mContent = mailContent[advisor!] as! String?
                                    cell.assistMailContent.text = mContent
                                }else{
                                    cell.assistMailContent.text = ""
                            }
            
            
            
            
            
                            // tap gesture recognizer をassistMailContentのTextViewに設置
                            let tap = UITapGestureRecognizer(target: self, action:"editMailContent:")
//                                       tap.delegate = self
                            cell.assistMailContent.addGestureRecognizer(tap)
            
            
            
            
                            //各Advisorのボタンがタップされた時の処理
                            //：をつけることで、sender情報を使える tagは数字しか送れないので注意！
                            cell.professor.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.professor.tag = 100//professor
            
                            cell.assailant.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.assailant.tag = 200//assailant
            
                            cell.committee.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.committee.tag = 300//committee
            
                            cell.psycotherapist.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.psycotherapist.tag = 400//psychotherapist
            
                            cell.lawyer.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.lawyer.tag = 500//lawyer
                                
                            cell.friend.addTarget(self, action:Selector("insert:"), forControlEvents:UIControlEvents.TouchUpInside)
                            cell.friend.tag = 600//friend
            
                            var personT = ["professor":"教授","assailant":"加害者","committee":"委員会","psycotherapist":"心理療法士","lawyer":"弁護士","friend":"友達"]
            
                            var pType  = myDefault.stringForKey("selectedAdvisor")
            
                            if pType != nil{
                                
                                cell.sentTo.text = personT[pType!]! + " 宛"
                                
                            }else{
                                
                                cell.sentTo.text = ""
                                cell.assistMailContent.text = "まず相談相手のタイプを選択してください。その後でこの画面をタップして相談内容を編集してください。"
                                
                                let silver:UIColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
                                cell.assistMailContent.textColor = silver
                                
                                cell.assistMailContent.editable = false
                                cell.assistMailContent.selectable = false
                       
                            }
        
            

            
            let HiddenSeparatorInset: UIEdgeInsets = UIEdgeInsetsMake(0, CGFloat(UInt16.max), 0, 0)
            cell.separatorInset = HiddenSeparatorInset
            
            
                            return cell
        }
        
        
        
        
        if adjustrow_no == 2 {
            
            var cell:assistChosePostsTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChosePostsCell", forIndexPath: indexPath) as! assistChosePostsTableViewCell
            
          


            
            let HiddenSeparatorInset: UIEdgeInsets = UIEdgeInsetsMake(0, CGFloat(UInt16.max), 0, 0)
            cell.separatorInset = HiddenSeparatorInset
            
            return cell
        }
    
            
        var cell:choseCustomCell = tableView.dequeueReusableCellWithIdentifier("choseCustomCell", forIndexPath: indexPath) as! choseCustomCell
        
        cell.layoutMargins = UIEdgeInsetsZero
        
        cell.postPortrait.image = UIImage(named: "selfee.JPG")
        cell.postName.text = "uminonar"
        
        var postindex = adjustrow_no-3

        cell.postCreated.text = posts[postindex]["created"] as! String
        
        var dateTime = posts[postindex]["when"] as! String
        cell.postWhen.text = dateTime+" 頃"
        cell.postWhere.text = posts[postindex]["where"] as! String
        cell.postWho.text = posts[postindex]["who"] as! String
        cell.postUniversity.text = posts[postindex]["university"] as! String
        
        
        cell.postDiary.text = posts[postindex]["diary"] as! String
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSParagraphStyleAttributeName : style]
        cell.postDiary.attributedText = NSAttributedString(string: cell.postDiary.text,
                                                           attributes: attributes)
        cell.postDiary.font = UIFont.systemFontOfSize(13)
        
        let myTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
    
        cell.postDiary.addGestureRecognizer(myTap)
        cell.postDiary.tag = postindex
        


        cell.postImageView.image = UIImage(named:(posts[postindex]["picture"] as! String))
        
        cell.coverBtn.addTarget(self, action: "selected:", forControlEvents: .TouchUpInside)
        cell.coverBtn.tag = postindex
        
        var selectedFlag = posts[postindex]["selectedFlag"] as! Bool
        
        
        if selectedFlag{
            
            cell.circle.image = UIImage(named: "checkedFilled")?.imageWithRenderingMode(.AlwaysTemplate)
            cell.circle.tintColor = UIColor.redColor()
        
            let paleGreen:UIColor = UIColor(red: 0.914, green: 0.980, blue: 0.950, alpha: 0.6)
        
//            let palePink:UIColor = UIColor(red: 0.990, green: 0.93, blue: 0.88, alpha:0.8)
        
            cell.backgroundColor = paleGreen
            
        }else{
            
            cell.circle.image = UIImage(named: "circle")
            cell.backgroundColor = UIColor.whiteColor()
 
        }

        return cell
        
        }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        
        var tag:Int = sender.view?.tag as! Int!
        print(tag)
        
        var selectedFlag = posts[tag]["selectedFlag"] as! Bool
        
        if selectedFlag{
            
            var postDic = posts[tag].mutableCopy() as! NSMutableDictionary
            postDic["selectedFlag"] = false
            
            
            posts[tag] = postDic
            
        }else{
            
            var postDic = posts[tag].mutableCopy() as! NSMutableDictionary
            postDic["selectedFlag"] = true
            
        
            posts[tag] = postDic
            
            
        }
        
        assistTableView.reloadData()
        
    }
    
    
    
    
    func selected(sender: UIButton) {
        
        var selectedFlag = posts[sender.tag]["selectedFlag"] as! Bool
        
        if selectedFlag{
            
            var postDic = posts[sender.tag].mutableCopy() as! NSMutableDictionary
            postDic["selectedFlag"] = false
            
            
            posts[sender.tag] = postDic
            
        }else{
            
            var postDic = posts[sender.tag].mutableCopy() as! NSMutableDictionary
            postDic["selectedFlag"] = true
            
            
            posts[sender.tag] = postDic
            
        }

        assistTableView.reloadData()

    }

    
    
    func editMailContent(sender:UITextView){
        let mailContentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MailContentViewController") as UIViewController
        
        presentViewController(mailContentVC, animated: true, completion: nil)

    }

    
    func insert(sender:UIButton){
       
        
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
    
    func chosePosts(sender:UIButton){
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)

    }
    
    
    

    
    // delegate didSelectRow
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if 0 == indexPath.row {
            //            // switching open or close
            //            sections[indexPath.section].extended = !sections[indexPath.section].extended
            
            if expandflag {
                expandflag = !expandflag
                self.toContract(tableView, indexPath: indexPath)
                
            }else{
                expandflag = !expandflag
                self.toExpand(tableView, indexPath: indexPath)
            }
            
            
        }
        // deselec
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    /// close details
    /// - parameter tableView: self.tableView
    /// - parameter indexPath: NSIndexPath
    /// - returns:
    private func toContract(tableView: UITableView, indexPath: NSIndexPath) {
        let startRow = indexPath.row + 1
        //let endRow = sections[indexPath.section].details.count + 1
        let endRow = startRow + 1
        
        var indexPaths: [NSIndexPath] = []
        for var i = startRow; i < endRow; i++ {
            indexPaths.append(NSIndexPath(forRow: i , inSection: indexPath.section))
        }
        rownumber -= 1
        
        tableView.deleteRowsAtIndexPaths(indexPaths,
                                         withRowAnimation: UITableViewRowAnimation.Fade)
        // 0行だけ更新(addWhen.textを黒字に変更したいので）
        let row = NSIndexPath(forRow: 0, inSection: 0)
        assistTableView.reloadRowsAtIndexPaths([row], withRowAnimation: UITableViewRowAnimation.Fade)
        
    }

    /// open details
    /// - parameter tableView: self.tableView
    /// - parameter indexPath: NSIndexPath
    /// - returns:
    private func toExpand(tableView: UITableView, indexPath: NSIndexPath) {
        let startRow = indexPath.row + 1
        //let endRow = sections[indexPath.section].details.count + 1
        let endRow = startRow + 1
        
        var indexPaths: [NSIndexPath] = []
        for var i = startRow; i < endRow; i++ {
            
            indexPaths.append(NSIndexPath(forRow: i, inSection: indexPath.section))
        }
        
        rownumber += 1
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        
        // scroll to the selected cell.
        tableView.scrollToRowAtIndexPath(NSIndexPath(
            forRow: indexPath.row, inSection: indexPath.section),
                                         atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        
        // 0行だけ更新(addWhen.textを赤字に変更したいので）
        let row = NSIndexPath(forRow: 0, inSection: 0)
        assistTableView.reloadRowsAtIndexPaths([row], withRowAnimation: UITableViewRowAnimation.Fade)
        
        
        
        
    }
    //MARK:ここでcellの高さが決まっている
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        var adjustrow_no = indexPath.row
        
        
        
        if indexPath.row == 0 {
            return 40
        }
        
        if indexPath.row == 1 {
            
            if expandflag{
                return 450
            }else{
            
                return 482
            }
        }
        
        if indexPath.row == 2 {
            
            if expandflag{
                return 482
            }else{

                return 35
            }
        }
        
        if indexPath.row == 3 {
            
            if expandflag{
                return 35
            }else{
        
                return 280
            }
        }else{
            return 280
        }
    }
 
    

    @IBAction func saveBtn(sender: UIButton) {
        
        //入力必須項目の確認
        //データを送信する
        
        //userDefaultの”selectedText”を空にする
        var myDefault = NSUserDefaults.standardUserDefaults()
        myDefault.removeObjectForKey("selectedAdvisor")
        myDefault.removeObjectForKey("editedText")
        myDefault.synchronize()
        
        
        assistTableView.reloadData()
        
        
        //assistMailContentを空にする、いらない
//        assistMailContent.text = ""
        
        

        
    }
    
//    TODO:キャンセルボタンをどう実装する？決定、取り消し
//    @IBAction func cancelBtn(sender: UIButton) {
//        var myDefault = NSUserDefaults.standardUserDefaults()
//        myDefault.removeObjectForKey("selectedAdvisor")
//        myDefault.removeObjectForKey("editedText")
//        myDefault.synchronize()
//        
//        assistTableView.reloadData()
//        
//        //assistMailContentを空にする、いらない
//        //        assistMailContent.text = ""
//        
//
//    }
    
    
    @IBAction func titleCoverBtn(sender: UIButton) {
        var height:CGFloat = 0.0
        assistTableView.setContentOffset(CGPointMake(0, height), animated: false)

        
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