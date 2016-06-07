//
//  dateTimeTableViewCell.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/06.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class dateTimeTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var addName: UILabel!
    @IBOutlet weak var addWhen: UITextField!
    @IBOutlet weak var addSelfee: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSelfee.image = UIImage(named:"selfee.JPG")
        addName.text
            = "uminonar"//ここだと表示されないのん？なぜ？
        
    
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
        
        return false
    }

    
   

}
