//
//  AddTableViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/06.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AddTableViewController: UIViewController {
    var expandflag = false
    var rownumber = 2
    
    var openFlag = 0
    
    @IBOutlet weak var addTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView.registerNib(UINib(nibName: "dateTimeCell", bundle: nil), forCellReuseIdentifier: "dateTimeCell")
        
        addTableView.registerNib(UINib(nibName: "datePickerCell", bundle: nil), forCellReuseIdentifier: "datePickerCell")
        
        addTableView.registerNib(UINib(nibName: "bottomCell", bundle: nil), forCellReuseIdentifier: "bottomCell")
    }
    
    //行数決定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rownumber
    }

    //表示内容を決定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell: UITableViewCell?
        
        
        if indexPath.row == 0{
            
            //cellを生成？
            var cell:dateTimeTableViewCell = tableView.dequeueReusableCellWithIdentifier("dateTimeCell", forIndexPath: indexPath) as! dateTimeTableViewCell
            
            //datePickerの値をuserDefaultから取り出す
            var myDefault = NSUserDefaults.standardUserDefaults()
            var changedDT = myDefault.stringForKey("selectedDT")
            
            //userDefaultから取り出されたdatePickerの日時をセット
            cell.addWhen.text = changedDT
            cell.addWhen.textColor = UIColor.redColor()
            cell.addName.text
                = "uminonar"
            
            return cell
            
        }else{
            if expandflag {
                
                var cell:datePickerTableViewCell = tableView.dequeueReusableCellWithIdentifier("datePickerCell", forIndexPath: indexPath) as! datePickerTableViewCell
                
                cell.addDatePicker.addTarget(self, action: "changedDT:", forControlEvents:UIControlEvents.ValueChanged)
                
                return cell
                
            }else{
                
                var cell:bottomTableViewCell = tableView.dequeueReusableCellWithIdentifier("bottomCell", forIndexPath: indexPath) as! bottomTableViewCell
                
                
                //ユーザーデフォルトから保存されたデータを取り出す
                var myDefault = NSUserDefaults.standardUserDefaults()
                
                //大学、データを呼び出して文字列が入っていたら、表示する
                var uniStr = myDefault.stringForKey("uniStr")
                
                if ( uniStr != nil){
                    cell.addUniversity.text = uniStr
                }
                
                //場所、データを呼び出して文字列が入っていたら表示する
                var selectedPlace = myDefault.stringForKey("selectedPlace")
                
                if( selectedPlace != nil){
                    print(selectedPlace)
                    cell.addWhere.text = selectedPlace
                }
                
                
                //名前、データを呼び出して文字列が入っていたら表示する
                var selectedName = myDefault.stringForKey("selectedName")
                
                if( selectedName != nil){
                    print(selectedName)
                    cell.addWho.text = selectedName
                }
                
                //Diaryデータを呼び出して文字列が入っていたら表示する
                var diaryText =
                    myDefault.stringForKey("diary")
                if((diaryText != nil) && (diaryText != "")){
                    print(diaryText)
                    cell.addDiary.text = diaryText
                    cell.addDiary.textColor = UIColor.blackColor()
                }else{
                    cell.addDiary.text = "大丈夫！しっかり記録していきましょう。。具体的にどんなことがありましたか？"
                    cell.addDiary.textColor = UIColor.lightGrayColor()
                }

                //.xibファイルのボタンなどがタップされ時の処理
                
                //postEllipsisBtn等の後に：をつけることで、sender情報を使える
                cell.addWhere.addTarget(self, action:"addWhere:", forControlEvents:UIControlEvents.TouchDown)
                
                cell.addWho.addTarget(self, action: "addWho:", forControlEvents:UIControlEvents.TouchDown)
                
                cell.addUniversity.addTarget(self, action: "addUniversity:", forControlEvents: UIControlEvents.EditingDidEndOnExit)//EditingDidEnd?違いは,カーソル離れたとき
                
                //何がダメ？
                cell.addUniversity.tag = sender.text
                
                
                
                // Add tap gesture recognizer to Text View
                let tap = UITapGestureRecognizer(target: self, action: Selector("tapAddDiary:"))
//                tap.delegate = self
                cell.addDiary.addGestureRecognizer(tap)
                
                // SwitchのOn/Off切り替わりの際に、呼ばれるイベントを設定する.
                cell.addSwitch.addTarget(self, action: "changeSwitch:", forControlEvents: UIControlEvents.ValueChanged)
                
                var changedSwitch = myDefault.stringForKey("switch")
                
                if ( changedSwitch != nil ){
                    cell.addImportance.text = "相談に利用予定"
                }else{
                    cell.addImportance.text = "念のため記録"
                }
                
                cell.picFileBtn.addTarget(self, action:"picFileBtn:",forControlEvents:.TouchUpInside)
                cell.movieFileBtn.addTarget(self, action: "movieFileBtn", forControlEvents: .TouchUpInside)
                cell.tapSound.addTarget(self, action: "tapSound", forControlEvents: .TouchUpInside)
                
                var picBaseImage = myDefault.stringForKey("pic")
                
                if ( picBaseImage != nil ){
                    //ここはこれじゃダメ？
                    cell.picBase.image = picBaseImage

                
                return cell
                
            }
        }
    }
    
    
    func changedDT(sender:UIDatePicker){
            
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:MM"
        var dateStr = df.stringFromDate(sender.date)
            
        //daatePickerで取得した日時をuserDefaultにセット
        var myDefault = NSUserDefaults.standardUserDefaults()
        myDefault.setObject(dateStr, forKey: "selectedDT")
        myDefault.synchronize()

        
            
        // 対象行だけ更新
        let row = NSIndexPath(forRow: 0, inSection: 0)
        addTableView.reloadRowsAtIndexPaths([row], withRowAnimation: UITableViewRowAnimation.Fade)
        //myTableView.reloadData()
    }
    
    func addWhere(){
        
        //これで合ってる？
        self.resignFirstResponder()
        
        let AddWhere = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddWhereViewController") as UIViewController
        
        presentViewController(AddWhere, animated: true, completion: nil)
    }

    func addWho(){
        
        self.resignFirstResponder()

        let AddWho = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddWhoViewController") as UIViewController
        
        presentViewController(AddWho, animated: true, completion: nil)
        
    }
    
    func addUniversity(tag:String){
        
        //これ合ってる？
        self.isFirstResponder()
        
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(tag, forKey: "uniStr")
        
        //即反映させる
        myDefault.synchronize()

    }
    
    func addDiary(){
        //addDiaryがタップされたら
        let AddDiaryVC = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("AddDiaryViewController") as UIViewController
        
        // showで遷移するバージョン           navigationController?.pushViewController(AddDiaryVC, animated: true)
        
        // モーダルで遷移するバージョン
        presentViewController(AddDiaryVC, animated: true, completion: nil)
    }
    
    func changeSwitch(sender: UISwitch){
        //addSwitchが変化したら
        if sender.on == true { //== trueはなくても良い
            var myDefault = NSUserDefaults.standardUserDefaults()
            myDefault.setObject(true, forKey: "switch")
            myDefault.synchronize()
        
            openFlag = 0
            
            
        }else{
            var myDefault = NSUserDefaults.standardUserDefaults()
            myDefault.setObject(nil, forKey: "switch")//userDefaultにnilは入れられる？
            myDefault.synchronize()
            
            //投稿情報のopenを1にする
            openFlag = 1
        }

    }
    
    func picFileBtn(){
        //pictureFileがタップされた時、カメラロールが現れ、選択された写真がaddImageViewに収められる
            var photoPick = UIImagePickerController()
        
            //ここは何がダメ？
            photoPick.delegate = self
        
            photoPick.sourceType = .PhotoLibrary
            self.presentViewController(photoPick, animated: true, completion: nil)
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
            
            var picBaseImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            var myDefault = NSUserDefaults.standardUserDefaults()
            myDefault.setObject(picBaseImage, forKey: "pic")
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }

    }
    
    func movieFileBtn(){
        //ここはどうする？
    }
    
    func tapSound(){
        let AddSound = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddSoundViewController") as UIViewController
        
        presentViewController(AddSound, animated: true, completion: nil)

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
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 70
        }
        if indexPath.row == 1 {
            if expandflag {
                return 180
            }else{
                return 120
            }
        }
        
        
        return 80.0//ここの意味は？
    }
    

    @IBAction func cancelBtn(sender: UIButton) {
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        myDefault.removeObjectForKey("diary")
        myDefault.synchronize()
        
        myDefault.removeObjectForKey("selectedPlace")
        myDefault.synchronize()
        
        myDefault.removeObjectForKey("selectedName")
        myDefault.synchronize()
        
        
        //ここはどうする？
        addWhen.text=""
        addWhere.text=""
        addWho.text=""
        addDiary.text=""

        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveBtn(sender: UIButton) {
        
        
        //必須項目が記入済みか、チェックする
        //未記入があったら、記入してくださいのアラート
        
        //全て記入済みだったら、
        //データをサーバーに渡す処理
        //UserDefaultのdiaryキーのところを空にする
        
        //テキストフィールドに記入するためにユーザーデフォルトに入れていた直前１件の履歴削除
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        myDefault.removeObjectForKey("diary")
        myDefault.synchronize()
        
        myDefault.removeObjectForKey("selectedPlace")
        myDefault.synchronize()
        
        myDefault.removeObjectForKey("selectedName")
        myDefault.synchronize()
        
        
        //ここどうしたら良い？
        addWhen.text=""
        addWhere.text=""
        addWho.text=""
        addDiary.text=""
        
        //前ページに遷移する　モーダル画面じゃなくので、dismissじゃないバージョン　後学のため残す
        //navigationController?.popViewControllerAnimated(true)
        
        //userDefaultにデータを書き込んで
        myDefault.setObject("true", forKey: "saveSuccess")
        
        //即反映させる
        myDefault.synchronize()
        
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
