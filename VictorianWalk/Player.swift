//
//  Player.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 31/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation
import SpriteKit

class player{
    
    var playerScoredInBars:[Int]
    var playerPennies:[SKNode]
    
    init(){
        playerScoredInBars = [Int]()
        for _ in 0...9 {
            playerScoredInBars.append(0);
        }
        playerPennies = [SKNode]()
        
    }
    
    func runTurn(){
        
    }
}
