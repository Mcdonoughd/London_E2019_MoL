//
//  pubGame.swift
//  VictorianWalk
//
//  Created by Museum of London on 31/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation
import SpriteKit

class pubGame{
    
    var turns = [Int]()
    
    var player1ScoredInBars = [Int]()
    var player2ScoredInBars = [Int]()

    
    var player1Pennys = [SKNode]()
    var player2Pennys =  [SKNode]()
    
    init(){
        
        var turn = 1;
        
        player1ScoredInBars = [Int]()
        player1Pennys = [SKNode]()
        
        player2ScoredInBars = [Int]()
        player2Pennys = [SKNode]()
        
        for _ in 0...9 {
            self.player1ScoredInBars.append(0);
            self.player2ScoredInBars.append(0);
        }
    }
    
    
}




