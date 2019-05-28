//
//  Booth.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This holds a Booths sidebar data
struct Booth{
    
    enum ActivityName :String{
        case Search
        case Quiz
        case Imagine
        case Act
        case game
        case none
        
        func toString() -> String{
            return self.rawValue
        }
    }
    
    var id = 0
    var desc = ""
    var title = ""
    var Activities = [ActivityName.none]
    
    init(id: Int, desc: String, title: String, Activities: Array<ActivityName>){
        self.id = id
        self.desc = desc
        self.title = title
        self.Activities = Activities
    }

    func hasActivity() -> Bool {
        return !(Activities.contains(.none))
    }
    
    
    
}
