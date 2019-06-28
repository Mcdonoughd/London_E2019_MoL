//
//  GameActivity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 30/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This holds data for game Activities (ie PubGame)
class GameActivity: Activity {
    private var segueRef = "" //segue reference to the game
    
    
    init(name:String,type:String,segueRef:String,desc:String){
        super.init(name:name,type:type,text:desc)
        self.segueRef = segueRef
    }
    
    //Getter
    func getSegueRef()->String{
        return segueRef
    }
    
    //Setter
    func setSegueRef(segref:String){
        self.segueRef = segref
    }
}
