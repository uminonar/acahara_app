//
//  PictureViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/03.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    var picSelectedIndex = -1

    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(picSelectedIndex)
        
       
    }
    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("posts", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        let dic = jsonArray[picSelectedIndex]

        pictureImageView.image = UIImage(named: dic["picture"] as! String)
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
