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
    
    init(name:String,type:String,question:String,answer:String,choices:Array<String>){
        super.init(name:name,type:type)
        self.question = question
        self.answer = answer
        self.choices = choices
    }
    
    //Shuffle the multiple choice answers to provide a unique expereince for each visitor
    func ShuffleChoices(){
        self.choices.shuffle()
    }
    
}
