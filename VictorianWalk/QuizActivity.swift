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
    private var choices = [String]()
    private var answer = ""
    private var answerIndex = 0
    
init(name:String,type:String,question:String,answer:String,choices:Array<String>,answerIndex: Int){
    super.init(name:name,type:type,text:question)
        self.answer = answer
        self.choices = choices
        self.answerIndex = answerIndex
    }
    
    init(name:String,type:String,question:String,answer:String){
        super.init(name:name,type:type,text:question)
        self.answer = answer
    }
    
    //Check if the activity has choices
    func hasChoices() -> Bool{
        if self.choices.count < 1 {
            return false
        }
        return true
    }
    
    //Getters
    func getChoices()->[String]{
        return self.choices
    }
    
    func getAnswer()->String{
        return self.answer
    }
    
    func getAnswerIndex()->Int{
        return self.answerIndex
    }
    
    //Setters
    func setChoices(choices:[String]){
        self.choices = choices
    }
    
    func setAnswer(answer:String){
        self.answer = answer
    }
    
    func setAnswerIndex(AnswerIndex:Int){
        self.answerIndex = AnswerIndex
    }
}
