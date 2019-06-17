//
//  pubGame.swift
//  VictorianWalk
//
//  Created by Museum of London on 31/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation
import SpriteKit


//this is the Pub Game model. This keeps track of the game states and data
class pubGame{
   
    var numberOfRounds:Int
    var numberOfPlayers:Int
    var numberOfPennies:Int
    var currentRound:Int
    var currentPlayersTurn:Int
    var PlayersArray = [player]()
    
    var currPennyHasGone = false
    
    
 
   
    init(numberOfRounds:Int, numberOfPennies: Int, numberOfPlayers:Int){
        self.numberOfPlayers = numberOfPlayers
        self.numberOfRounds = numberOfRounds
        self.numberOfPennies = numberOfPennies
        
        currentRound = 0
        currentPlayersTurn = 0
        makePlayers(players: numberOfPlayers)
    }
    
    func makePlayers(players:Int){
        for _ in 1...players{
            let newPlayer = player(amountOfPennies: numberOfPennies)
            self.PlayersArray.append(newPlayer)
        }
    }
    
    func getCurrentPenny() -> Penny{
       return PlayersArray[currentPlayersTurn].getPennyFromPlayer()
    }
    
    func nextTurn(){
        
        if(PlayersArray[currentPlayersTurn].currentPenny == numberOfPennies-1){
            if(currentPlayersTurn+1 == numberOfPlayers){
                currentPlayersTurn = 0
                currentRound = currentRound + 1
                if(currentRound > numberOfRounds){
                    currentRound = -1 //Indicates game is over
                }
            }else{
                //PlayersArray[currentPlayersTurn].runTurn()
                currentPlayersTurn = currentPlayersTurn + 1
            }
            
        }else{
            PlayersArray[currentPlayersTurn].currentPenny+=1
        }
        

    }
    
    
    
}





