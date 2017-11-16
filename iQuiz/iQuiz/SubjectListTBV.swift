//
//  SubjectListTBV.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/7.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class SubjectListTBV: UITableViewController {
    
    var subjectList = [Subject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let subject1 = Subject(name:"Mathematics", desc:"Do you want to test your matheamtic skills?", image:"math.png")
        subjectList += [subject1]
        
        let subject2 = Subject(name:"Marvel Super Heros", desc:"Do you want to do some quizes?", image:"hero.png")
        subjectList += [subject2]
        
        let subject3 = Subject(name:"Science", desc:"Do you want to do some science quizes?", image:"science.jpeg")
        subjectList += [subject3]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
            height = 220
        
        return height
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        let s = subjectList[indexPath.row] as Subject
       
        //cell content
        cell.textLabel?.text = s.subjectName
        cell.detailTextLabel?.text = s.subjectDesc
        cell.imageView?.image = UIImage(named:s.subjectImageName)
        
        //font sizes configurations
        cell.textLabel?.font = UIFont(name: "Arial", size:25)
        cell.textLabel?.numberOfLines = 2
        cell.detailTextLabel?.font = UIFont(name: "Arial", size:18)
        cell.detailTextLabel?.numberOfLines = 3
        //cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        //image size configurations
        let itemSize = CGSize(width:120.0, height:120.0)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, 0.0)
        let imageRect = CGRect(x:0.0, y:0.0, width:itemSize.width, height:itemSize.height)
        cell.imageView?.image!.draw(in:imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        //cell.textLabel.numberOfLines = 0;
 
        return cell
    }
    
    @IBAction func settings(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedRow")
        UserDefaults.standard.set(0, forKey: "queNumber")
        UserDefaults.standard.set(0, forKey: "rightNumber")
        //UserDefaults.standard.integer(forKey: "selectedRow") = indexPath.row
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
