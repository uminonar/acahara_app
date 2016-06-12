//
//  AssistTableViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AssistTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate,UITextFieldDelegate,SideMenuDelegate {

    var sideMenu : SideMenu?
    var expandflag = false
    var rownumber = 3
    
    @IBOutlet weak var sendBtn: UIButton!

    @IBOutlet weak var assistBars: UIButton!
    
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
        
        let bars = FAKFontAwesome.barsIconWithSize(20)
        //下記でアイコンの色も変えられます
        bars.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        
        let barsImage = bars.imageWithSize(CGSizeMake(20, 20))
        
        assistBars.setImage(barsImage, forState: .Normal)
        
        
        //飛行機、決定送信
        let send = FAKFontAwesome.paperPlaneIconWithSize(20)
        bars.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor())
        let sendImage = send.imageWithSize(CGSizeMake(20, 20))
        sendBtn.setImage(sendImage, forState: .Normal)
        
        
        //MARK:サイドメニューの項目をここで決定
        sideMenu = SideMenu(sourceView: self.view, menuData: ["使い方", "設定", "利用規約"])
        sideMenu!.delegate = self
        
        
    }
    
    
    //サイドメニューの項目が選択された時、SideMenu.swiftの中にあるtoggleMenu()を実行
    func sideMenuDidSelectItemAtIndex(index: Int) {
        sideMenu?.toggleMenu()
    }
    
    //トグルボタンがタップされた時も、SideMenu.swiftの中にあるtoggleMenu()を実行
    @IBAction func toggleSideMenu(sender: AnyObject) {
        sideMenu?.toggleMenu()
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
            
            if expandflag{
                
                let info = FAKFontAwesome.infoIconWithSize(15)
                info.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor())
                let infoImage = info.imageWithSize(CGSizeMake(15, 15))
                cell.assistInfo.image = infoImage
                
                cell.assistInfoS.textColor = UIColor.blueColor()

            }else{
                
                let info = FAKFontAwesome.infoIconWithSize(15)
                info.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor())
                let infoImage = info.imageWithSize(CGSizeMake(15, 15))
                cell.assistInfo.image = infoImage


                
                cell.assistInfoS.textColor = UIColor.blackColor()
            }

            
            
            return cell
            
        }
        
        var adjustrow_no = indexPath.row
        
        if expandflag{
            if indexPath.row == 1{

                
            var cell:assistInfoDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistInfoDetailCell", forIndexPath: indexPath) as! assistInfoDetailTableViewCell
                
                
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
                            //：をつけることで、sender情報を使える
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
            
            
            
    
            
            
            
                                
                            return cell
        }
        
        
        
        
        if adjustrow_no == 2 {
            
            var cell:assistChosePostsTableViewCell = tableView.dequeueReusableCellWithIdentifier("assistChosePostsCell", forIndexPath: indexPath) as! assistChosePostsTableViewCell
            
            cell.assistQmarkBtn.addTarget(self, action:Selector("chosePosts:"), forControlEvents:UIControlEvents.TouchUpInside)
            
            cell.assistQsentenceBtn.addTarget(self, action:Selector("chosePosts:"), forControlEvents:UIControlEvents.TouchUpInside)
            
            return cell
        }
        
    
        //普通のセル生成　それ以外。
        
        var emptycell:UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        
        return emptycell
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
        if indexPath.row == 0 {
            return 35
        }
        if indexPath.row == 1 {
            return 430
        }
        if indexPath.row == 2 {
            return 180
        }
        
        return 100//ここの意味は？とりあえず全部のケースを網羅する。
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
    
    
    @IBAction func assistBarBtn(sender: UIButton) {
        
        //TODO:サイドバーを表示する
        
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