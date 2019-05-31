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
    

    var currentTurn:Int
    var numberOfTurns:Int
    
    var playerOne:player
    var playerTwo:player
   
    init(numberOfTurns: Int){
        
        self.numberOfTurns = numberOfTurns
        
        playerOne = player()
        playerTwo = player()
        
        currentTurn = 0
        
    }
    
    
    
}


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
