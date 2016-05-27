//
//  SecondViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/05/26.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var font: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     let font = FAKFontAwesome.trashIconWithSize(40)
    // 下記でアイコンの色も変えられます
    // trash.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
    let trashImage = trash.imageWithSize(CGSizeMake(40, 40))
    
     font.image = trashImage
    }

   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

