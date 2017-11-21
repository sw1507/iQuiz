//
//  Questions.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/20.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import Foundation
import UIKit
public class Question{
    let text: String
    let answer: Int
    let answers: [String]
    public init(_ t: String, _ aas : [String],_ a: Int) {
        text = t
        answers = aas
        answer = a - 1
    }
}

public class Questions {
    let title: String
    let desc: String
    let questions: [Question]
    
    public init(_ t: String, _ des : String,_ a: [Question]) {
        title = t
        desc = des
        questions = a
    }
}
public class Quiz: NSObject, NSCoding {
    var subject : String = ""
    var icon : UIImage?
    var quizDescription : String = ""
    
    init(subject: String, quizDesc: String, icon: UIImage?) {
        self.subject = subject
        self.icon = icon
        self.quizDescription = quizDesc
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.subject, forKey: "subject")
        aCoder.encode(self.icon, forKey: "icon")
        aCoder.encode(self.quizDescription, forKey: "quizDescription")
    }
    required convenience public init?(coder decoder: NSCoder) {
        guard let subject = decoder.decodeObject(forKey: "subject") as? String,
            let quizDescription = decoder.decodeObject(forKey: "quizDescription") as? String?,
            let icon = decoder.decodeObject(forKey: "quizDescription") as? UIImage?
            else { return nil }
        
        self.init(
            subject: subject,
            quizDesc: quizDescription!,
            icon: icon
        )
    }
    
    override public var description : String {
        return "\(subject), \(quizDescription)"
    }
    
    
}

extension Questions{
}


class Quizes: NSObject {
    private (set) var list: [Quiz] = Array()
    static let shared = getOriginalQuizes()
    private static let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "quizes"
    
    override init() {
        super.init()
    }
    
    func add(quiz: Quiz) {
        list.append(quiz)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Quizes.filePath)
    }
    
    func loadFromFile() {
        let list = NSKeyedUnarchiver.unarchiveObject(withFile: Quizes.filePath) as? [Quiz]
        if list != nil {
            self.list = list!
        }
    }
    func clear() {
        self.list = Array()
    }
    
    func remove(at: Int) {
        list.remove(at: at)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Quizes.filePath)
    }
    public static func getOriginalQuizes() -> Quizes {
        return Quizes()
    }
    
}
class QuestionS {
    static let shared = getQuestionsS()
    var list : [String: [Question]]
    init () {
        self.list = [:]
    }
    private static func getQuestionsS() -> QuestionS{
        return QuestionS()
    }
    
}
