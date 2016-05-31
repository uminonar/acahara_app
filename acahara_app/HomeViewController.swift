//
//  FirstViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var homeBgImage: UITableView!
    @IBOutlet weak var homeTableView: UITableView!

  
    // ボタンを用意
    var addBtn: UIBarButtonItem!
    
    var posts:NSMutableArray = []
    
    //var temp:NSMutableArray

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.registerNib(UINib(nibName: "postCustomCell", bundle: nil), forCellReuseIdentifier: "postCustomCell")
        
//        self.title = "Home"
        
        // addBtnを設置
        addBtn = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = addBtn
        
        //イメージに背景画像を設置
        

    }
    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("posts", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        for data in jsonArray{
            posts.addObject(data as! NSMutableDictionary)
        }
    }
    
    //行数決定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    //表示内容を決定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
            
        // 1. 生成するセルをカスタムクラスへダウンキャスト
        // 既存のCell生成コードの後に as! <Cellのカスタムクラス名> という記述を追加
        var cell = tableView.dequeueReusableCellWithIdentifier("postCustomCell", forIndexPath: indexPath) as! homeTableViewCell
        cell.postCreated.text = posts[indexPath.row]["created"] as! String
        cell.postWhen.text = posts[indexPath.row]["when"] as! String
        cell.postWhere.text = posts[indexPath.row]["where"] as! String
        cell.postWho.text = posts[indexPath.row]["who"] as! String
        cell.postUniversity.text = posts[indexPath.row]["university"] as! String
        cell.postDiary.text = posts[indexPath.row]["diary"] as! String
        cell.postImageView.image = UIImage(named:(posts[indexPath.row]["picture"] as! String))
        
        
        //postsのopenFlag==1のセルだけ下のようにしたい
        
        var openFlag:String = posts[indexPath.row]["openFlag"] as! String
        
        if (openFlag == "1"){

            cell.backgroundColor = UIColor.groupTableViewBackgroundColor()
            cell.postDiary.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        }else{
            cell.backgroundColor = UIColor.whiteColor()
            cell.postDiary.backgroundColor = UIColor.whiteColor()
            
        }
        
        //settingBtnの後に：をつけることで、sender情報を使える
        cell.settingBtn.addTarget(self, action:"settingBtn:", forControlEvents:.TouchUpInside)
        cell.settingBtn.tag = indexPath.row
        
        
        cell.postMoreBtn.addTarget(self, action:"detailVC:",forControlEvents:.TouchUpInside)
        
        return cell
    }
    
    
    func settingBtn(sender: UIButton) {
        
        print("\(sender.tag)番目")
        
        var settingController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        settingController.addAction(UIAlertAction(title: "削除", style: .Default, handler: { action in self.confirm(sender.tag)}))
        
        //openFlagが１の時は「念のため記述」にしたい、０の時は「相談に利用予定」 = posts[indexPath.row][openFlag]どう書く？if、ここに書ける？
        
        var tempStr:String = ""
        var openFlag:String = posts[sender.tag]["openFlag"] as! String
        
        

        if(openFlag == "1"){
            tempStr = "「相談に利用予定」へ変更"
        }else{
            tempStr = "「念のため記録」へ変更"
        }
        settingController.addAction(UIAlertAction(title: tempStr, style: .Default, handler:{ action in self.changeMode(sender.tag)}))
        
        
        settingController.addAction(UIAlertAction(title: "キャンセル", style: .Cancel, handler: { action in
            print("cancel")
        }))
        
        
        presentViewController(settingController, animated: true, completion: nil)
    }
    

  func changeMode(tag:Int){
    var openFlag:String = posts[tag]["openFlag"] as! String
    
    var dic:NSMutableDictionary = posts[tag].mutableCopy() as! NSMutableDictionary
    
    if (openFlag=="0"){
        dic.setValue("1", forKey: "openFlag")
    }else{
        dic.setValue("0", forKey: "openFlag")

    }
    
    posts[tag] = dic
    
    homeTableView.reloadData()
    
   }
    
    func confirm(tag:Int){
        
        var alertController = UIAlertController(title:"ご注意", message: "本当に削除しますか？", preferredStyle: .Alert)
        
        
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.deletePost(tag
            )}))
        
        alertController.addAction(UIAlertAction(title: "cancel", style: .Cancel, handler: {action in print("cancel")}))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func deletePost(tag:Int){
//        論理削除を記述したいけど、どうやる？以下は物理削除だけれど書き方は？サーバー
        
        posts.removeObjectAtIndex(tag)
        self.homeTableView.reloadData()
    }
    
    
    //moreボタンでdetailVCに遷移する  下記、Mainではない?これ何？
    func detailVC(sender: UIButton){
        
        let detailVC = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as UIViewController
        
        navigationController?.pushViewController(detailVC, animated: true)
    }




    // addBtnをタップしたときのアクション
    func onClick() {
        
        let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddViewController") as UIViewController
        
        self.navigationController?.pushViewController(second, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

