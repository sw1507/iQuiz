//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/15.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var rowNumber = 0
    var queCounts = 0
    var selectedAns = 0
    var rightOrNot = "Wrong"
    var pickerData: [String] = [String]()
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
    //let ansView : AnsViewController! = nil
    func setUp() -> Void{
        let queArray : [[String]] = [q0, q1, q2]
        let ansArray = [ans0 , ans1, ans2]
        let corArray = [cor0, cor1, cor2]
        UserDefaults.standard.set(queArray, forKey: "ques")
        UserDefaults.standard.set(ansArray, forKey: "ans")
        UserDefaults.standard.set(corArray, forKey: "cor")
        //AnsPicker.dataSource = ansArray[rowNumber][0]
    }
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var AnsPicker: UIPickerView!
    
    @IBAction func SubmitButton(_ sender: AnyObject) {
        var q = UserDefaults.standard.integer(forKey: "queNumber")
        let corArray = UserDefaults.standard.array(forKey: "cor") as! [[Int]]
        var r = UserDefaults.standard.integer(forKey: "rightNumber")
        if corArray[rowNumber][q] == selectedAns {
            r += 1
            rightOrNot = "Correct"
        }
        //AnsViewController.set(ques : self.QLabel.text, corAns: pickerData[corArray[rowNumber][q]], result: rightOrNot)
        UserDefaults.standard.set(r, forKey: "rightNumber")
        q += 1
        UserDefaults.standard.set(q, forKey: "queNumber")
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAns = row
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUp()
        rowNumber = UserDefaults.standard.integer(forKey: "selectedRow")
        let queNumber = UserDefaults.standard.integer(forKey: "queNumber")
        self.AnsPicker.delegate = self
        self.AnsPicker.dataSource = self
        let ques = UserDefaults.standard.array(forKey: "ques")! as! [[String]]
        self.QLabel.text = ques[rowNumber][queNumber]
        let answers = UserDefaults.standard.array(forKey: "ans")! as! [[[String]]]
        pickerData = answers[rowNumber][queNumber]
        queCounts = ques[rowNumber].count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if segue.identifier == "Segue1"{
            return
        }
        let destination = segue.destination as! AnswerViewController
        let q = UserDefaults.standard.integer(forKey: "queNumber")
        let corArray = UserDefaults.standard.array(forKey: "cor") as! [[Int]]
        destination.ques = self.QLabel.text
        destination.corAns = pickerData[corArray[rowNumber][q - 1]]
        destination.result = rightOrNot
        var LastQuestion = 0
        if (queCounts == q ) {
            LastQuestion = 1
        }
        destination.LastQue = LastQuestion
        // Pass the selected object to the new view controller.
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
