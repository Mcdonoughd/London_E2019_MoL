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
    var currentRound:Int
    var PlayersArray = [player]()
    
    
    
    enum gamestates {
        case OPENING
        case PLAYING
        case CLOSING
    }
    
    var currentGameState:gamestates
 
   
    init(numberOfRounds:Int, numberOfPennies: Int, numberOfPlayers:Int){
        self.numberOfPlayers = numberOfPlayers
        self.numberOfRounds = numberOfRounds
        self.numberOfPennies = numberOfPennies
        
        currentRound = 1
        currentGameState = gamestates.OPENING
        
        makePlayers(players: numberOfPlayers)
    }
    
    func makePlayers(players:Int){
        for _ in 1...players{
            let newPlayer = player(amountOfPennies: numberOfPennies)
            self.PlayersArray.append(newPlayer)
        }
    }
    
}





