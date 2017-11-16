//
//  FinishViewController.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/15.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    let r = UserDefaults.standard.integer(forKey: "rightNumber")
    let q = UserDefaults.standard.integer(forKey: "queNumber")
    var Desc = ""
    
    @IBOutlet weak var DescText: UILabel!
    @IBOutlet weak var ScoreText: UILabel!
    
    @IBAction func Next(_ sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreText.text = "\(r) of \(q) correct"
        let correctRate = Double(r)/Double(q)
        if (r == q){
            Desc = "Perfect!"
        } else if (correctRate > 0.9){
            Desc = "Almost!"
        } else {
            let diff = q - r
            Desc = "\(diff) missed!"
        }
        DescText.text = Desc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
