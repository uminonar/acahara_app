//
//  DetailViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/30.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dtSelectedIndex = -1

    var posts:NSMutableArray = []
    
    @IBOutlet weak var detailSelfee: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailWhen: UILabel!
    @IBOutlet weak var detailWhere: UILabel!
    @IBOutlet weak var detailWho: UILabel!
    @IBOutlet weak var detailUniversity: UILabel!
    @IBOutlet weak var detailCreated: UILabel!
    @IBOutlet weak var detailVolume: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailSelfee.image = UIImage(named: "selfee.JPG")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("posts", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        let dic = jsonArray[dtSelectedIndex]
        
        detailSelfee.image=UIImage(named: "selfee.JPG")
        detailName.text = "Uminonar"
        detailWhen.text = dic["when"] as! String
        detailWhere.text = dic["where"] as! String
        detailWho.text = dic["who"] as! String
        detailUniversity.text = dic["university"] as! String
        detailTextView.text = dic["diary"] as! String
        detailImageView.image = UIImage(named: "picture")
        
        let volume = FAKFontAwesome.volumeUpIconWithSize(18)
        let volumeImage = volume.imageWithSize(CGSizeMake(18, 18))
        
        detailVolume.image = volumeImage
        
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
