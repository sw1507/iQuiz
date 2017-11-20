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
    var sub = ""
    var corCount = 0
    var curQs : [Question]?
    var qCount : Int = 0
    var userAns : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let q = self.curQs![self.qCount]
        
        CorAnsText.text = q.answers[q.answer]
        if self.userAns == q.answer{
            self.corCount += 1
            ResultLabel.text = "Right!"
        } else {
            ResultLabel.text = "Wrong!"
        }
        QuesText.text = q.text
    }

    @IBAction func NextButton(_ sender: AnyObject) {
        if (self.qCount + 1 == self.curQs!.count) {
            performSegue(withIdentifier: "finish", sender: self)
        } else {
            performSegue(withIdentifier: "nextSegue", sender: self)
            //self.dismiss(animated: true, completion: nil)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "finish") {
            let destination = segue.destination as! FinishViewController
            destination.corCount = self.corCount
            destination.qCount = self.curQs!.count
        }
        else if (segue.identifier == "nextSegue") {
            let destination = segue.destination as! QuestionViewController
            destination.qIndex = self.qCount + 1
            destination.subject = self.sub
            destination.numCrt = self.corCount
        }
    }
}
