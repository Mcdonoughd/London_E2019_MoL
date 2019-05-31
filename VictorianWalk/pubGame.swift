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
    
    var numberOfRounds:Int
    var numberOfPlayers:Int
    var numberOfPennies:Int
    var currentTurn:Int
    var PlayersArray = [player]()
 
   
    init(numberOfRounds:Int, numberOfPennies: Int, numberOfPlayers:Int){
        self.numberOfPlayers = numberOfPlayers
        self.numberOfRounds = numberOfRounds
        self.numberOfPennies = numberOfPennies
        
        currentTurn = 0
        
        makePlayers(players: numberOfPlayers)
    }
    
    func makePlayers(players:Int){
        for _ in 1...players{
            let newPlayer = player()
            self.PlayersArray.append(newPlayer)
        }
    }
    
}





