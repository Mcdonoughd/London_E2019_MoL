//
//  TextActivity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation


//This struct holds the text information of a TextActivity
class TextActivity: Activity {
    
    var text = ""
    var type = ""
    var answer = ""
    
    init(text: String){
        self.text = text
        answer = "none"
    }
    
    init(text:String, answer: String){
        self.text = text
        self.answer = answer
    }
    
}
