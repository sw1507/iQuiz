//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/15.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var q0:[String] = ["1 + 1 = ?", "6 * 7 = ?", "5 ! = ?"]
    var ans0 = [["1", "2", "4", "6"], ["5", "10", "42", "19"], ["120", "110", "200", "100"]]
    var cor0 = [1, 2, 0]
    var q1 = ["What city is the home of Badman?", "What school does Harry Potter attend?"]
    var ans1 = [["Gotham City", "Fothem City",
                 "Los Angeles", "New York"],
                ["St Andrews", "Hogwarts", "Coventry", "Hyde" ]]
    var cor1 = [0, 1]
    var q2 = ["The hardest substance available on earth is:", "Which is a non metal that remains liquid at room temperature?"]
    var ans2 = [["Gold", "Iron", "Diamond", "Platinum"],
                ["Phosphorous", "Bromine", "Chlorine", "Helium"]]
    var cor2 = [2, 1]
    var subject = ""
    var rowNumber = 0
    var queCounts = 0
    var selectedAns = 0
    var rightOrNot = "Wrong"
    var questionS = QuestionS.shared
    var pickerData: [String] = [String]()
    var qIndex = 0
    var curQs : [Question]? = nil
    var numCrt = 0
    //let ansView : AnsViewController! = nil
  
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var AnsPicker: UIPickerView!
    
    @IBAction func SubmitButton(_ sender: AnyObject) {
           performSegue(withIdentifier: "ToAnswer", sender: self)
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let q = self.curQs![qIndex]
        return q.answers[row]
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AnsPicker.delegate = self
        self.AnsPicker.dataSource = self
        self.curQs = questionS.list[subject]
        //print ("self.curQs: \(self.curQs)")
        queCounts = (self.curQs?.count)!
        let q = self.curQs![qIndex]
        self.QLabel.text = q.text
        print ("from QView: \(self.QLabel.text)")
        // Do any add=itional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if segue.identifier == "ToAnswer"{
            let destination = segue.destination as! AnswerViewController
            destination.userAns = self.AnsPicker.selectedRow(inComponent: 0)
            destination.sub = self.subject
            destination.corCount = self.numCrt
            destination.qCount = self.qIndex
            destination.curQs = self.curQs
        }
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
