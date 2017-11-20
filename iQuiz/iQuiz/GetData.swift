//
//  GetData.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/20.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import Foundation
import UIKit

class GetData{
    static let queS = QuestionS.shared
    static let quizes = Quizes.shared
    //static let quizes = Quizes.getOriginalQuizes()
    public static func getData(_ givenUrl: String? = "http://tednewardsandbox.site44.com/questions.json") {
        var u = givenUrl
        if (u == nil) {
            u = "http://tednewardsandbox.site44.com/questions.json"
        }
        if (u == ""){
            u = "http://tednewardsandbox.site44.com/questions.json"
        }
        let url = URL(string: u!)
        //print (u)
        let urlRequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) -> Void in
            if (response == nil) {
                return
            }
            let httpResponce = response
            let statusCd = (httpResponce as! HTTPURLResponse).statusCode
            if (statusCd == 200) {
                do {
                    quizes.clear()
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [AnyObject]
                    for quizJs in json{
                        let title = quizJs["title"] as! String
                        let desc = quizJs["desc"]
                        let icon : UIImage? = nil
                        var questions = [Question]()
                        let questionsJs = quizJs["questions"] as! [[String: AnyObject]]
                        for questionJs in questionsJs {
                            let text = questionJs["text"]
                            let crtAns = Int(questionJs["answer"] as! String)
                            let answers = questionJs["answers"]
                            let question = Question(text as! String, answers as! [String], crtAns!)
                            questions.append(question)
                            //print ("fromGetData question \(question.text) \(question.answer)")
                        }
                        queS.list[title] = questions
                        let quiz = Quiz(subject: title, quizDesc: desc as! String, icon: icon)
                        quizes.add(quiz: quiz)
                        //print ("from GetData")
                        //print (quizes.list)
                        //print ("fromGetData ques.list \(queS.list)")
                    }
                    
                } catch {
                    print ("Error in GetData class from Json: \(error)")
                }
            }
        }).resume()
        sleep(1)
    }
}
