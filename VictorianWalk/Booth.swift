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
    enum games{
        case pub
        case pharmacy
        case engraver
        case none
    }
    
    var desc = ""
    var title = ""
    var hasGame = games.none
    
    init(desc: String, title: String, hasGame: games){
        self.desc = desc
        self.title = title
        self.hasGame = hasGame
        
    }
    
    
}
