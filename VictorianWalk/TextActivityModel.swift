//
//  TextActivityModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

class TextActivityModel {
//    var TextActivity = TextActivity()
    let errorActivity = "Take a deep breath..."
    
    
    var ActivityLookUp:[Array<String> : String] = [
        ["Bank Manager's Office","Imagine"]:"Text description",
        []:""
        
    ]
    
    func getActivityText(key:Array<String>) -> String{
        return ActivityLookUp[key] ?? errorActivity
    }
    
    
    
}
