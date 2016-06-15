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
    @IBOutlet weak var addBtn: UIButton!

    @IBOutlet var baseView: UIView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var contentView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toggle = FAKFontAwesome.barsIconWithSize(25)
        toggle.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor())
        let toggleImage = toggle.imageWithSize(CGSizeMake(25, 25))
        toggleBtn.setImage(toggleImage, forState: .Normal)
        
        let add = FAKFontAwesome.editIconWithSize(25)
        add.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor())
        let addImage = add.imageWithSize(CGSizeMake(25, 25))
        
        addBtn.setImage(addImage, forState: .Normal)

        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        var myDefault = NSUserDefaults.standardUserDefaults()
        var stepAdd = myDefault.stringForKey("stepAdd")
        
        if stepAdd != nil{
            //"stepAdd"を空にして
            //タブで記録のページAddTableVCへ切り替え
            //そちらで記録成功が普通に表示される
        }
    }
    
    @IBAction func stepAddBtn(sender: UIButton) {
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        myDefault.setObject("1", forKey: "stepAdd")
        
        myDefault.synchronize()
        
        
        
        let AddTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddTableViewController") as UIViewController
        
        presentViewController(AddTableView, animated: true, completion: nil)
    }

    @IBAction func tapSideBar(sender: UIButton) {
        
        //ここどう記述？
        //target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
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
