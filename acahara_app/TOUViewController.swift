//
//  TOUViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/07/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class TOUViewController: UIViewController {

    @IBOutlet weak var menuCoverBtn: UIButton!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var TOUMenu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        scrollView.contentSize.height = 2000
        
//        let sakura:UIColor = UIColor(red:1.0,green:0.3,blue:0.3,alpha:1.0)
//
//        //sideBar向け
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
//        
//        TOUMenu.image = UIImage(named:"menu")?.imageWithRenderingMode(.AlwaysTemplate)
//        
//        let sakura3:UIColor = UIColor(red:1.0,green:0.3,blue:0.3,alpha:1.0)
//        
//        TOUMenu.tintColor = sakura3
//        
//        self.menuCoverBtn.addTarget(SSASideMenu(), action: Selector("presentLeftMenuViewController"), forControlEvents: UIControlEvents.TouchUpInside)
//
        
        
        
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
