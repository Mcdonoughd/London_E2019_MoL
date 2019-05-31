//
//  GameActivity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 30/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

class GameActivity: Activity {
    var segueRef = ""
    var desc = ""
    
    init(name:String,type:String,segueRef:String,desc:String){
        super.init(name:name,type:type)
        self.segueRef = segueRef
        self.desc = desc
    }
    
}
