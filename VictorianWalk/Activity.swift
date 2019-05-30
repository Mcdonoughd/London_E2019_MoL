//
//  Activity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 30/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation


//This is the Parent Class of all Activities
class Activity{
    var name = ""
    var type = ""
    
    init(name: String, type:String){
        self.name=name
        self.type=type
    }
    
    
}
