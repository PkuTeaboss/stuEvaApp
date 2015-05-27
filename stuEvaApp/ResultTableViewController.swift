//
//  ResultTableViewController.swift
//  stuEvaApp
//
//  Created by arman on 5/27/15.
//  Copyright (c) 2015 arman. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var macLabel: UILabel!
    @IBOutlet weak var xcodeLabel: UILabel!
    @IBOutlet weak var expectedLanguageLabel: UILabel!
    @IBOutlet weak var officeHourLabel: UILabel!
    
    @IBOutlet weak var genderPercentLabel: UILabel!
    @IBOutlet weak var majorPercentLabel: UILabel!
    @IBOutlet weak var languagePercentLabel: UILabel!
    @IBOutlet weak var macPercentLabel: UILabel!
    @IBOutlet weak var xcodePercentLabel: UILabel!
    @IBOutlet weak var expectedLanguagePercentLabel: UILabel!
    @IBOutlet weak var officeHourPercentLabel: UILabel!
    
    
    var datatSet = [ArmanData]()
    var result = ArmanResult()
    var maxResult = ArmanData()
    var maxResultDict = [String: String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        getMaxResult()
    
        genderLabel.text = maxResult.xingbie
        genderPercentLabel.text = maxResultDict["xingbie"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func getData() {
        if let url = NSURL(string: "http://174.140.168.150:8000/invest/invest_list.php") {
            if let response = NSData(contentsOfURL: url, options: NSDataReadingOptions.allZeros, error: nil) {
                let jsonData = JSON(data: response)
                for list in jsonData["list"].arrayValue {
                    let data = ArmanData()
                    data.xuehao = list["xuehao"].stringValue
                    data.xingming = list["xingming"].stringValue
                    data.xingbie = list["xingbie"].stringValue
                    data.zhuanye = list["zhuanye"].stringValue
                    data.shulianyuyan = list["shulianyuyan"].stringValue
                    data.macshulianchengdu = list["macshulianchengdu"].stringValue
                    data.xcodeshulianchengdu = list["xcodeshulianchengdu"].stringValue
                    data.jiangshouyuyan = list["jiangshouyuyan"].stringValue
                    data.dayishijianduan = list["dayishijianduan"].stringValue
                    datatSet.append(data)
                    
                    if contains(result.xingbie.keys, data.xingbie) {
                        result.xingbie.updateValue(result.xingbie[data.xingbie]!+1, forKey: data.xingbie)
                    }
                    
//                    if contains(result.zhuanye.keys, data.zhuanye) {
//                        result.zhuanye.updateValue(result.zhuanye[data.zhuanye]!+1, forKey: data.zhuanye)
//                    }
//                    
//                    if contains(result.shulianyuyan.keys, data.shulianyuyan) {
//                        result.shulianyuyan.updateValue(result.shulianyuyan[data.shulianyuyan]!+1, forKey: data.shulianyuyan)
//                    }
//                    if contains(result.macshulianchengdu.keys, data.macshulianchengdu) {
//                        result.macshulianchengdu.updateValue(result.macshulianchengdu[data.macshulianchengdu]!+1, forKey: data.macshulianchengdu)
//                    }
//                    if contains(result.xcodeshulianchengdu.keys, data.macshulianchengdu) {
//                        result.xcodeshulianchengdu.updateValue(result.xcodeshulianchengdu[data.xcodeshulianchengdu]!+1, forKey: data.xcodeshulianchengdu)
//                    }
//                    if contains(result.jiangshouyuyan.keys, data.jiangshouyuyan) {
//                        result.jiangshouyuyan.updateValue(result.jiangshouyuyan[data.jiangshouyuyan]!+1, forKey: data.jiangshouyuyan)
//                    }
//                    if contains(result.dayishijianduan.keys, data.dayishijianduan) {
//                        result.jiangshouyuyan.updateValue(result.jiangshouyuyan[data.jiangshouyuyan]!+1, forKey: data.jiangshouyuyan)
//                    }
                    
                }
            }
            
        }
//        println(Array(result.xingbie).sorted( {$0.1 > $1.1} ).first!.0)
//        println(result.xingbie.values.array.reduce(0, combine: +))
        
    }
    
    func getMaxResult() {
        maxResult.xingbie = Array(result.xingbie).sorted( {$0.1 > $1.1} ).first!.0
        var maxValue = result.xingbie.values.array.reduce(0, combine: +)
        println(maxValue)
        println(result.xingbie[maxResult.xingbie]!)
        var percent = (Float(result.xingbie[maxResult.xingbie]!) / Float(maxValue)) * 100
        maxResultDict.updateValue(String(stringInterpolationSegment: percent) + "%", forKey: "xingbie")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 7
    }

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
