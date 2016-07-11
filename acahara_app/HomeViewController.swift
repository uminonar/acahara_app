//
//  FirstViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var countNum = 0
    var selectedIndex = -1
    @IBOutlet weak var homeTableView: UITableView!



  
    // ボタンを用意
    var addBtn: UIBarButtonItem!
    
    var posts:NSMutableArray = []
    
    //var temp:NSMutableArray
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //セルの高さを可変にする設定、テキストの長さ、写真の有無で可変にしたい
        homeTableView.estimatedRowHeight = 323
        homeTableView.rowHeight = UITableViewAutomaticDimension
        
        
        homeTableView.registerNib(UINib(nibName: "postCustomCell", bundle: nil), forCellReuseIdentifier: "postCustomCell")
//        homeTableView.registerNib(UINib(nibName: "homeIntroCell", bundle: nil), forCellReuseIdentifier: "homeIntroCell")
        
//        self.title = "Home"
        
        // addBtnを設置
//        addBtn = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
//        self.navigationItem.rightBarButtonItem = addBtn
//        
//       
//        let write = FAKFontAwesome.pencilSquareOIconWithSize(25)
//        //下記でアイコンの色も変えられます
//        write.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
//        
//        let writeImage = write.imageWithSize(CGSizeMake(25, 25))
//        
//        homeWrite.setImage(writeImage, forState: .Normal)
//        
        
        let path = NSBundle.mainBundle().pathForResource("posts", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        for data in jsonArray{
            posts.addObject(data as! NSMutableDictionary)
            
        }

    }
    
    

    
    
    
    override func viewWillAppear(animated: Bool) {
        
        // ナビゲーションを透明にする処理
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        //データ記録画面で保存した後に表示されたとわかったとき
        var myDefault = NSUserDefaults.standardUserDefaults()
        var afterSaved = myDefault.objectForKey("saveSuccess")
        //保存成功のアラートを表示
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

        //最新情報をリロード
//      self.homeTableView.reloadData()//これ何の意味？
            }
        }


    }
    
    
    
    
    
    
    
    //行数決定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    //表示内容を決定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        
//        if indexPath.row == 0{
//            
//            //cellを生成？
//            var cell:homeIntroTableViewCell = tableView.dequeueReusableCellWithIdentifier("homeIntroCell", forIndexPath: indexPath) as! homeIntroTableViewCell
//            
//
//            return cell
//        }else{

            
        // 1. 生成するセルをカスタムクラスへダウンキャスト
        // 既存のCell生成コードの後に as! <Cellのカスタムクラス名> という記述を追加
        var cell = tableView.dequeueReusableCellWithIdentifier("postCustomCell", forIndexPath: indexPath) as! homeTableViewCell
        cell.postCreated.text = posts[indexPath.row]["created"] as! String
        
        var dateTime = posts[indexPath.row]["when"] as! String
        cell.postWhen.text = dateTime+" 頃"
        cell.postWhere.text = posts[indexPath.row]["where"] as! String
        cell.postWho.text = posts[indexPath.row]["who"] as! String
        cell.postUniversity.text = posts[indexPath.row]["university"] as! String
        
        
        var diary = posts[indexPath.row]["diary"] as! String
        var charCount = diary.characters.count
        
        if (charCount >= 106){
            var abstractDiary =  (diary as NSString).substringToIndex(106)
            cell.diaryLabel.text = abstractDiary + "..."
        }else{
            cell.diaryLabel.text = diary
        }
        
        //冒頭から106取ってくる設定
//        var abstractDiary = (diary as NSString).substringToIndex(106)
        
        
        
        //フォントサイズの調整
   
        //cell.postDiary.font = UIFont(name: "System", size: 40)
        cell.postWho.font = UIFont.systemFontOfSize(12)
        cell.postUniversity.font = UIFont.systemFontOfSize(12)
        
        //行間の設定 ここで大きさがリセットされているから、リセット後にサイズを指定しないといけない
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSParagraphStyleAttributeName : style]
        cell.diaryLabel.attributedText = NSAttributedString(string: cell.diaryLabel.text!,
                                                      attributes: attributes)
        
        cell.diaryLabel.font = UIFont.systemFontOfSize(15)
        
        // Add tap gesture recognizer to Text View

        
        cell.labelCoverBtn.addTarget(self, action:"showMore:", forControlEvents:.TouchUpInside)
        cell.labelCoverBtn.tag = indexPath.row
        print(posts[0]["picture1"])
        var pic1 = posts[indexPath.row]["picture1"] as! String
        var pic2 = posts[indexPath.row]["picture2"] as! String
        var pic3 = posts[indexPath.row]["picture3"] as! String
        var pic4 = posts[indexPath.row]["picture4"] as! String
        var pic5 = posts[indexPath.row]["picture5"] as! String
        
        var picArray = [pic1,pic2,pic3,pic4,pic5]
        
        var selectedPictures = [] as! NSMutableArray
        
        
        //空でない写真を配列selectedPicturesにセット
        for selectedPic in picArray{
            
            if selectedPic != ""{
                selectedPictures.addObject(selectedPic)
            }
            
        }
        
        
        //選択されている写真の数
        var picNum = selectedPictures.count
        
        if picNum > 0{
            
            //選択写真が存在したらスクロールが走る表示全体サイズを指定。写真の125幅に、15の余白で140
            let scrViewWidth:CGFloat = CGFloat(140 * picNum )

            cell.scrView.contentSize = CGSizeMake(scrViewWidth, 125)

            
        }else{
            
            //選択写真が存在しない場合、画像表示箇所が縮まるように
            cell.scrView.frame.size.height = 0
            cell.scrView.frame.size.width = 0
            cell.postImageViewBtn.frame.size.height = 0
            cell.postImageViewBtn.frame.size.width = 0
        }
        
        
        //写真を表示する
        countNum = 0
        for strURL in selectedPictures{
            
            print(strURL)
            
            var url = NSURL(string: strURL as! String)
            
            let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([url!], options: nil)
            
            if fetchResult.firstObject != nil{
                
                let asset: PHAsset = fetchResult.firstObject as! PHAsset
                
                
                print("pixelWidth:\(asset.pixelWidth)");
                print("pixelHeight:\(asset.pixelHeight)");
                
                let manager: PHImageManager = PHImageManager()
                manager.requestImageForAsset(asset,targetSize: CGSizeMake(5, 500),contentMode: .AspectFit,options: nil) { (image, info) -> Void in
                    
                    //imageViewのaspectFitをつける必要がある？このままで良いかも
                    var imageView = UIImageView()
                    
                    //各写真イメージのX座標開始位置をpositionXとする。125幅に、15の余白で140
                    var positionX:CGFloat = CGFloat(140 * self.countNum)
                    
                    //写真の位置サイズ指定
                    imageView.frame = CGRectMake(positionX, 0, 125, 125)
                    imageView.image = image
                    cell.scrView.addSubview(imageView)
                    
                    //写真を選択するための透明ボタンを設置する
                    var picChoseBtn = UIButton()
                    picChoseBtn.setTitle("", forState: .Normal)
                    picChoseBtn.frame = CGRectMake(positionX, 0, 125, 125)
                    picChoseBtn.addTarget(self, action: "showPicture:", forControlEvents:.TouchUpInside)
                    cell.scrView.addSubview(picChoseBtn)
                    
                    picChoseBtn.tag = indexPath.row


                    self.countNum++
                }
            }
        }
        
        
        
//        cell.postImageView.image = UIImage(named:(posts[indexPath.row]["picture"] as! String))
//
//        if (posts[indexPath.row]["picture"] as! String == ""){
////            cell.postImageView.hidden = false
//            cell.postImageView.frame.size.height = 0
//            cell.postImageView.frame.size.width = 0
//            
//            
//        }
        
        
        
        
        
        //postsのopenFlag==1のセルだけ下のようにしたい
        
        var openFlag:String = posts[indexPath.row]["openFlag"] as! String
        
        if (openFlag == "1"){
            
            //色を使って指定する
            let paleBlue:UIColor = UIColor(red:0.914,green:0.941,blue:0.980,alpha:1.0)

            cell.backgroundColor = paleBlue
            cell.diaryLabel.backgroundColor = paleBlue
        
        }else{
            cell.backgroundColor = UIColor.whiteColor()
            cell.diaryLabel.backgroundColor = UIColor.whiteColor()
            
        }
        
        //.xibファイルのボタンがタップされ時の処理
        
        //postEllipsisBtn等の後に：をつけることで、sender情報を使える
        cell.postEllipsisBtn.addTarget(self, action:"postEllipsisBtn:", forControlEvents:.TouchUpInside)
        cell.postEllipsisBtn.tag = indexPath.row
        
        
        cell.postMoreBtn.addTarget(self, action:"showMore:",forControlEvents:.TouchUpInside)
        cell.postMoreBtn.tag = indexPath.row
        
//        cell.postTextViewBtn.addTarget(self, action:"showMore:",forControlEvents: .TouchUpInside)
//        cell.postTextViewBtn.tag = indexPath.row

        
        return cell
        
    }
    
    
    //各行の高さを指定する
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        if indexPath.row == 0 {
//            return 110
//        }else{
//      
//            return 355
//        }
//        
//        return 80//ここの意味は？とりあえず全部のケースを網羅する。
//    }
    
    
    
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
        
        var xPosition = sender.frame.origin.x
        
        //配列selectedPicturesの何番目の写真が選択されたか
        var numOfPic = xPosition/140 as! Int
        

        let pictureVC = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("PictureViewController") as! PictureViewController
    
        pictureVC.picSelectedIndex = sender.tag
        pictureVC.numOfSelectedPicture = numOfPic
            
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
    
    


    @IBAction func addBtn(sender: UIBarButtonItem) {
           
        let AddTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddTableViewController") as UIViewController
        
        presentViewController(AddTableView, animated: true, completion: nil)

        
        
    }


    // addBtnをタップしたときのアクション
//    func onClick() {
//        
//        
//        let AddTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddTableViewController") as UIViewController
//        
//        presentViewController(AddTableView, animated: true, completion: nil)
//        
        //ナビゲーションコントローラによる遷移
        //  let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddViewController") as UIViewController

        // 　self.navigationController?.pushViewController(second, animated: true)
        
        // その際に、次の画面でタブを消す設定、エラーが出る
        //        var add = AddViewController(nibName:"AddViewController",bundle:nil)
        //        add.hidesBottomBarWhenPushed = true
        //
        //        self.navigationController?.pushViewController(add,animated:true)
//    }

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

