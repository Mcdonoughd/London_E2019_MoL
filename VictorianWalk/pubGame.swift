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
   
    private var numberOfRounds:Int
    private var numberOfPlayers:Int
    private var numberOfPennies:Int
    private var currentRound:Int
    private var currentPlayersTurn:Int
    private var PlayersArray = [player]()
    

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
        
        if(PlayersArray[currentPlayersTurn].getcurrPenny() == numberOfPennies-1){
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
            PlayersArray[currentPlayersTurn].runTurn()
        }
        

    }
    
    deinit{
        PlayersArray.removeAll()
        print("Deallocated pubGame Model")
    }
    
    func getCurrPlayer()->Int{
        return self.currentPlayersTurn
    }
    
    func getCurrentRound()->Int{
        return self.currentRound
    }
    
    func getcurrentRound()->String{
        return String(self.currentRound)
    }
    
    func getPlayerArray()->[player]{
        return PlayersArray
    }
}





