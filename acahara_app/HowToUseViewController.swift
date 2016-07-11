//
//  HowToUseViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/07/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class HowToUseViewController: UIViewController {


    @IBOutlet weak var addBtn: UIImageView!
    @IBOutlet weak var htuCoverBtn: UIButton!
    @IBOutlet weak var htuMenu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let sakura:UIColor = UIColor(red:1.0,green:0.3,blue:0.3,alpha:1.0)
        
        //sideBar向け
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        htuMenu.image = UIImage(named:"menu")?.imageWithRenderingMode(.AlwaysTemplate)
        
        let sakura3:UIColor = UIColor(red:1.0,green:0.3,blue:0.3,alpha:1.0)
        
        htuMenu.tintColor = UIColor.whiteColor()
        
        self.htuCoverBtn.addTarget(SSASideMenu(), action: Selector("presentLeftMenuViewController"), forControlEvents: UIControlEvents.TouchUpInside)

        // Do any additional setup after loading the view.
        
        addBtn.image = UIImage(named:"create")?.imageWithRenderingMode(.AlwaysTemplate)
        addBtn.tintColor = UIColor.whiteColor()

    }

    @IBAction func addCoverBtn(sender: UIButton) {

        var myDefault = NSUserDefaults.standardUserDefaults()
        
        myDefault.setObject("1", forKey: "stepAdd")
        
        myDefault.synchronize()
        
        
        
        let AddTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AddTableViewController") as UIViewController
        
        presentViewController(AddTableView, animated: true, completion: nil)
        
    
     }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
      
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
