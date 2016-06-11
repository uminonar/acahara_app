//
//  HomeNavigationController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/09.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //高さを変更する
        self.navigationBar.frame = CGRectMake(0,0, UIScreen.mainScreen().bounds.size.width, 65)
        
    }
    
    //画面遷移後の呼び出しメソッド
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        
        self.navigationBar.frame = CGRectMake(0,0, UIScreen.mainScreen().bounds.size.width, 65)
        
        //ナビゲーションバーの背景画像を設定する。
//        self.navigationBar.setBackgroundImage(UIImage(named: "bgImage.JPG"), forBarMetrics: .Default)
        
        let sakura:UIColor = UIColor(red:1.0,green:0.4,blue:0.4,alpha:1.0)
//        
//        self.navigationBar.tintColor = sakura
        
        
        self.navigationBar.barTintColor = UIColor.groupTableViewBackgroundColor()
        
        //ナビゲーションバーのシャドウイメージを設定する。
//        self.navigationBar.shadowImage = UIImage(named: "mokume_test2.png")
        
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
