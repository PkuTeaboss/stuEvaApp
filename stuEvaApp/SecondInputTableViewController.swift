//
//  SecondInpuTableViewController.swift
//  stuEvaApp
//
//  Created by arman on 5/25/15.
//  Copyright (c) 2015 arman. All rights reserved.
//

import UIKit

class SecondInputTableViewController: UITableViewController {
    
    @IBOutlet weak var language: UITextField!
    
    @IBOutlet weak var mac: UITextField!
    
    @IBOutlet weak var xcode: UITextField!
    
    @IBOutlet weak var expectedLanguage: UITextField!
    
    @IBOutlet weak var officeHour: UITextField!
    
    var data = ArmanData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! MainTableViewController
        data.shulianyuyan = language.text
        data.macshulianchengdu = mac.text
        data.xcodeshulianchengdu = xcode.text
        data.jiangshouyuyan = expectedLanguage.text
        data.dayishijianduan = officeHour.text
        //postData()
        destination.data.append(data)
    }
    
    func postData(){
        if let url = NSURL(string: "http://174.140.168.150:8000/invest/invest_add.php?xuehao=\(data.xuehao)&xingming=\(data.xingming)&xingbie=\(data.xingbie)&zhuanye=\(data.zhuanye)&shouji=\(data.shouji)&email=\(data.email)&shulianyuyan=\(data.shulianyuyan)&macshulianchengdu=\(data.macshulianchengdu)&xcodeshulianchengdu=\(data.xcodeshulianchengdu)&jiangshouyuyan=\(data.jiangshouyuyan)&dayishijianduan=\(data.dayishijianduan)") {
            
            if let response = NSData(contentsOfURL: url, options: NSDataReadingOptions.allZeros, error: nil) {
                let json = JSON(data: response)
                //print(json)
                if json["ecode"].intValue == 0 {
                    //showMessage("Insertion Successful", message: "数据插入成功")
                    data.status = "数据插入成功"
                }
                else if json["ecode"].intValue == 1001 {
                    //showMessage("Insertion Failed", message: "该学号已填写")
                    data.status = "该学号已填写"
                }
                else {
                    //showMessage("Insertion Failed", message: "数据插入失败")
                    data.status = "数据插入失败"
                }
            }
            
        }
        
    }
    
//    func showError() {
//        let ac = UIAlertController(title: "连接失败", message: "请检查网络连接正常并已连接国际网关", preferredStyle: UIAlertControllerStyle.Alert)
//        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        presentViewController(ac, animated: true, completion: nil)
//    }
    
//    func showMessage(result: String, message: String) {
//        let ac = UIAlertController(title: result, message: message, preferredStyle: .Alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//        presentViewController(ac, animated: true, completion: nil)
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
