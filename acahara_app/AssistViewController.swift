//
//  AssistViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/04.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AssistViewController: UIViewController {



    
    @IBOutlet weak var assistComments: UIImageView!
    @IBOutlet weak var assistInfo: UIImageView!
    @IBOutlet weak var assistEye: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let info = FAKFontAwesome.infoIconWithSize(15)
        let infoImage = info.imageWithSize(CGSizeMake(15, 15))
        assistInfo.image = infoImage
        
        let comments = FAKFontAwesome.commentsOIconWithSize(15)
        let commentsImage = comments.imageWithSize(CGSizeMake(15, 15))
        assistComments.image = commentsImage
        
        let eye = FAKFontAwesome.eyeIconWithSize(15)
        let eyeImage = eye.imageWithSize(CGSizeMake(15, 15))
        assistEye.image = eyeImage
        

    }
    
    override func viewWillAppear(animated: Bool) {

    }
    

    @IBAction func chosePostsVC(sender: UIButton) {
        //ChosePostsVCへモーダル遷移
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)

        
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
