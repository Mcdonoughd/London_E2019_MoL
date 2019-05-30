//
//  TextActivity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation


//This struct holds the text information of a TextActivity (ie ACT or SEARCH)
class TextActivity: Activity {
    var text = ""
    
    init(name:String,type:String,text: String){
        super.init(name:name,type:type)
        self.text = text
    }
}
