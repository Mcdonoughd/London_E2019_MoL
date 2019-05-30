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
    
    var id = 0
    var desc = ""
    var title = ""
    var hasActivity = false
    
    init(id: Int, desc: String, title: String){
        self.id = id
        self.desc = desc
        self.title = title
    }

    init(id: Int, desc: String, title: String,hasActivity: Bool){
        self.id = id
        self.desc = desc
        self.title = title
        self.hasActivity = hasActivity
    }
    
    
}
