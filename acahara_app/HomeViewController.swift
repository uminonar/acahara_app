//
//  FirstViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedIndex = -1
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
        var myDefault = NSUserDefaults.standardUserDefaults()
        var afterSaved = myDefault.objectForKey("saveSuccess")
        
        
        if( afterSaved != nil){
            let alert: UIAlertController = UIAlertController(title: "記録成功", message: "負けないで！", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true) { () -> Void in
            let delay = 1.0 * Double(NSEC_PER_SEC)
            let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
            self.dismissViewControllerAnimated(true, completion: nil)
            })
                
            myDefault.removeObjectForKey("saveSuccess")
            myDefault.synchronize()

        }
            
        }
            
        
        
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
        
        var dateTime = posts[indexPath.row]["when"] as! String
        cell.postWhen.text = dateTime+" 頃"
        cell.postWhere.text = posts[indexPath.row]["where"] as! String
        cell.postWho.text = posts[indexPath.row]["who"] as! String
        cell.postUniversity.text = posts[indexPath.row]["university"] as! String
        cell.postDiary.text = posts[indexPath.row]["diary"] as! String
        cell.postImageView.image = UIImage(named:(posts[indexPath.row]["picture"] as! String))
        
        
        //postsのopenFlag==1のセルだけ下のようにしたい
        
        
        
        
        var openFlag:String = posts[indexPath.row]["openFlag"] as! String
        
        if (openFlag == "0"){
            
            //色を使って指定する
            let paleBlue:UIColor = UIColor(red:0.914,green:0.941,blue:0.980,alpha:1.0)

            cell.backgroundColor = paleBlue
            cell.postDiary.backgroundColor = paleBlue
        
        }else{
            cell.backgroundColor = UIColor.whiteColor()
            cell.postDiary.backgroundColor = UIColor.whiteColor()
            
        }
        
        //.xibファイルのボタンがタップされ時の処理
        
        //postEllipsisBtn等の後に：をつけることで、sender情報を使える
        cell.postEllipsisBtn.addTarget(self, action:"postEllipsisBtn:", forControlEvents:.TouchUpInside)
        cell.postEllipsisBtn.tag = indexPath.row
        
        
        cell.postMoreBtn.addTarget(self, action:"showMore:",forControlEvents:.TouchUpInside)
        cell.postMoreBtn.tag = indexPath.row
        
        cell.postTextViewBtn.addTarget(self, action:"showMore:",forControlEvents: .TouchUpInside)
        cell.postTextViewBtn.tag = indexPath.row
        
        cell.postImageViewBtn.addTarget(self, action: "showPicture:", forControlEvents: .TouchUpInside)
        cell.postImageViewBtn.tag = indexPath.row

        
    

        return cell
    }
    
    
    //削除が選択された時の関数
    func postEllipsisBtn(sender: UIButton) {
        
        print("\(sender.tag)番目")
        
        var postEllipsisController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        postEllipsisController.addAction(UIAlertAction(title: "削除", style: .Default, handler: { action in self.confirm(sender.tag)}))
        
        //openFlagが１の時は「念のため記述」にしたい、０の時は「相談に利用予定」 = posts[indexPath.row][openFlag]どう書く？if、ここに書ける？
        
        var tempStr:String = ""
        var openFlag:String = posts[sender.tag]["openFlag"] as! String
        
        

        if(openFlag == "1"){
            tempStr = "「相談に利用予定」へ変更"
        }else{
            tempStr = "「念のため記録」へ変更"
        }
        postEllipsisController.addAction(UIAlertAction(title: tempStr, style: .Default, handler:{ action in self.changeMode(sender.tag)}))
        
        
        postEllipsisController.addAction(UIAlertAction(title: "キャンセル", style: .Cancel, handler: { action in
            print("cancel")
        }))
        
        
        presentViewController(postEllipsisController, animated: true, completion: nil)
    }

    //moreボタンpostTextViewBtnでdetailVCに遷移する
    func showMore(sender: UIButton){
        
        let detailVC = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        detailVC.dtSelectedIndex = sender.tag
        
        
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //postImageViewBtnをタップするとpictureVCに遷移する
        func showPicture(sender: UIButton){
    
            let pictureVC = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("PictureViewController") as! PictureViewController
    
            pictureVC.picSelectedIndex = sender.tag
            
            navigationController?.pushViewController(pictureVC, animated: true)

    
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
    
    
    //削除が選択された時の、確認アラート
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
    
    





    // addBtnをタップしたときのアクション
    func onClick() {
        
        
        let AddView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddViewController") as UIViewController
        
        presentViewController(AddView, animated: true, completion: nil)
        
        //ナビゲーションコントローラによる遷移
        //  let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddViewController") as UIViewController

        // 　self.navigationController?.pushViewController(second, animated: true)
        
        // その際に、次の画面でタブを消す設定、エラーが出る
        //        var add = AddViewController(nibName:"AddViewController",bundle:nil)
        //        add.hidesBottomBarWhenPushed = true
        //
        //        self.navigationController?.pushViewController(add,animated:true)
    }

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

