//
//  QuizActivity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 30/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This class holds data for Quiz-like activities (IE QUIZ or IMAGINE)
class QuizActivity: Activity{
    var question = ""
    var choices = [String]()
    var answer = ""
    var answerIndex = 0
    
    init(name:String,type:String,question:String,answer:String,choices:Array<String>,answerIndex: Int){
        super.init(name:name,type:type)
        self.question = question
        self.answer = answer
        self.choices = choices
        self.answerIndex = answerIndex
    }
    
    init(name:String,type:String,question:String,answer:String){
        super.init(name:name,type:type)
        self.question = question
        self.answer = answer
    }
    
    func hasChoices() -> Bool{
        if self.choices.count < 1 {
            return false
        }
        return true
    }
    
    
    //Shuffle the multiple choice answers to provide a unique expereince for each visitor
    func ShuffleChoices() -> Array<String>{
        
        //todo make a shuffle
        
        return choices
    }
    
}
