//
//  MenuTableViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/12.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

protocol MenuTableViewControllerDelegate {
    func menuControllerDidSelectRow(indexPath:NSIndexPath)
}

class MenuTableViewController: UITableViewController {
    
    var delegate : MenuTableViewControllerDelegate?
    var tableData : Array<String> = []
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            
            //テキストの色指定はここ！
            cell!.textLabel!.textColor = UIColor.whiteColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel!.text = tableData[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        delegate?.menuControllerDidSelectRow(indexPath)
    }
}