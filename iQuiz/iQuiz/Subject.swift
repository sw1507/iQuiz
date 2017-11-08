//
//  Subject.swift
//  iQuiz
//
//  Created by YuanShaochen on 2017/11/7.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class Subject: NSObject {
    
    var subjectName: String
    var subjectDesc: String
    var subjectImageName: String
    
    override init() {
        subjectName = ""
        subjectDesc = ""
        subjectImageName = ""
    }
    
    init(name: String, desc: String, image: String){
        subjectName = name
        subjectDesc = desc
        subjectImageName = image
        
    }

}
