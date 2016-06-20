//
//  StepViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/13.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {

    @IBOutlet weak var toggleBtn: UIButton!

    @IBOutlet weak var addBtn: UIImageView!

    @IBOutlet var baseView: UIView!

    @IBOutlet weak var headerView: UIView!
 
    @IBOutlet weak var contentView: UIView!
    
    



    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toggle = FAKFontAwesome.barsIconWithSize(25)
        toggle.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor())
        let toggleImage = toggle.imageWithSize(CGSizeMake(25, 25))
        
        toggleBtn.setImage(toggleImage, forState: .Normal)
        
        self.toggleBtn.addTarget(SSASideMenu(), action: Selector("presentLeftMenuViewController"), forControlEvents: UIControlEvents.TouchUpInside)


        //ここで黒からtintで色を変えている
        addBtn.image = UIImage(named:"create")?.imageWithRenderingMode(.AlwaysTemplate)
        
        addBtn.tintColor = UIColor.whiteColor()
//        soudan.image = UIImage(named:"troubledWoman.jpg")
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        var myDefault = NSUserDefaults.standardUserDefaults()
        var stepAdd = myDefault.stringForKey("stepAdd")
        
        if stepAdd != nil{
            //"stepAdd"を空にして
            var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
            
            myDefault.removeObjectForKey("stepAdd")
            
            //タブで記録のページAddTableVCへ切り替え
            //そちらで記録成功が普通に表示される
//            上記のタブ切り替えの方法だと、デリゲートメソッドがコールバックされない?
        
            self.tabBarController!.selectedIndex = 1;
        }
    }
    
    @IBAction func stepAddBtn(sender: UIButton) {
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        myDefault.setObject("1", forKey: "stepAdd")
        
        myDefault.synchronize()
        
        
        
        let AddTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddTableViewController") as UIViewController
        
        presentViewController(AddTableView, animated: true, completion: nil)
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
