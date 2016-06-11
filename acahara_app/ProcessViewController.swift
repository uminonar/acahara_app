//
//  ProcessViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/10.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit


class ProcessViewController: UIViewController {

    @IBOutlet weak var troubledWoman: UIImageView!
    
    
    
    
    
  
    
    
    @IBOutlet weak var prepare: UIImageView!
    @IBOutlet weak var advisors: UIImageView!
    @IBOutlet weak var pen: UIImageView!

    @IBOutlet weak var recordCircle: UIView!
    @IBOutlet weak var assistCircle: UIView!
    @IBOutlet weak var prepareCircle: UIView!
 
    
    
    
    @IBOutlet var processScrollView: UIScrollView!
    @IBOutlet weak var processView: UIView!
    @IBOutlet weak var processWrite: UIButton!
    @IBOutlet weak var processBars: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        processScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200)
        
        let bars = FAKFontAwesome.barsIconWithSize(20)
        //下記でアイコンの色も変えられます
        bars.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        
        let barsImage = bars.imageWithSize(CGSizeMake(35, 30))
        
        processBars.setImage(barsImage, forState: .Normal)
        
//        
        let write = FAKFontAwesome.pencilSquareOIconWithSize(25)
        //下記でアイコンの色も変えられます
        write.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        
        let writeImage = write.imageWithSize(CGSizeMake(25, 25))
        
        processWrite.setImage(writeImage, forState: .Normal)
//
        recordCircle.layer.cornerRadius = 40;
        recordCircle.clipsToBounds = true;
      
        assistCircle.layer.cornerRadius = 40;
        assistCircle.clipsToBounds = true;
        
        prepareCircle.layer.cornerRadius = 40;
        prepareCircle.clipsToBounds = true;
        
    }
    
    
    @IBAction func tapAddVC(sender: UIButton) {
        
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
