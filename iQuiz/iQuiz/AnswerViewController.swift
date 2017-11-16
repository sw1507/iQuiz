//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/15.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var QuesText: UILabel!
    @IBOutlet weak var CorAnsText: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    var ques : String?
    var corAns: String?
    var result: String?
    var LastQue: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        QuesText.text = ques
        CorAnsText.text = "Your answer is:\n \(corAns!)"
        ResultLabel.text = result
        
        // Do any additional setup after loading the view.
    }
    @IBAction func NextButton(_ sender: AnyObject) {
        if LastQue == 0{
            self.performSegue(withIdentifier: "Segue1", sender: self)
        } else {
            self.performSegue(withIdentifier: "Segue2", sender: self)
        }
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
