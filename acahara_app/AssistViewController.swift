//
//  AssistViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/04.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AssistViewController: UIViewController {



    @IBOutlet weak var assistSideTrig: UIButton!
    @IBOutlet weak var assistMailContent: UITextView!
    @IBOutlet weak var assistComments: UIImageView!
    @IBOutlet weak var assistInfo: UIImageView!
    @IBOutlet weak var assistEye: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let sideT = FAKFontAwesome.barsIconWithSize(40)
//        let sideTImage = sideT.imageWithSize(CGSizeMake(40, 40))
//        assistSideTrig.imageView = UIImage(named:sideTImage)
//        
        
        let info = FAKFontAwesome.infoIconWithSize(15)
        let infoImage = info.imageWithSize(CGSizeMake(15, 15))
        assistInfo.image = infoImage
        
        let comments = FAKFontAwesome.commentsOIconWithSize(15)
        let commentsImage = comments.imageWithSize(CGSizeMake(15, 15))
        assistComments.image = commentsImage
        
        let eye = FAKFontAwesome.eyeIconWithSize(15)
        let eyeImage = eye.imageWithSize(CGSizeMake(15, 15))
        assistEye.image = eyeImage
        
        
        // assistMailContentのTextViewに枠をつける。
        assistMailContent.layer.borderWidth = 0.5
        
        // 枠の色を設定する。
        assistMailContent.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 枠の角を丸くする。
        assistMailContent.layer.cornerRadius = 8
        
       
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    

    @IBAction func chosePostsVC(sender: UIButton) {
        //ChosePostsVCへモーダル遷移
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)
        
        
    }
       @IBAction func questionBtn(sender: UIButton) {
        //ChosePostsVCへモーダル遷移
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)
    }
    
    @IBAction func professorBtn(sender: UIButton) {
       
        assistMailContent.text = "aiueo"
        assistMailContent.textColor = UIColor.blackColor()
        
    }
    @IBAction func assailant(sender: UIButton) {
        assistMailContent.text = ""
    }
    @IBAction func committeeBtn(sender: UIButton) {
        assistMailContent.text = ""
    }
    @IBAction func psycotherapistBtn(sender: UIButton) {
        assistMailContent.text = ""
    }
    @IBAction func lawyerBtn(sender: UIButton) {
        assistMailContent.text = ""
    }
    @IBAction func friendBtn(sender: UIButton) {
        assistMailContent.text = ""
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
