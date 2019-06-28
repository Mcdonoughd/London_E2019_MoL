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
    private var amountOfPennies:Int
    private var playerScoredInBars:[Int]
    private var playerPennies = [Penny]()
    private var currentPenny:Int
    
    init(amountOfPennies: Int){
        playerScoredInBars = [Int]()
        for _ in 0...9 {
            playerScoredInBars.append(0);
        }
        currentPenny = 0
        self.amountOfPennies = amountOfPennies
        for _ in 1...amountOfPennies{
            playerPennies.append(Penny())
        }
    }
    
    
    func getPennyFromPlayer()->Penny{
        print("Current Penny: " + String(currentPenny))
       return playerPennies[currentPenny]
    }
    
    //increment the currentpenny count
    func runTurn(){
        currentPenny = currentPenny + 1
    }
    
    deinit{
        //playerPennies = nil
        playerPennies.removeAll()
        playerScoredInBars.removeAll()
        print("Player as been deallocated")
    }
    
    //Getters
    func getAmountofPennies()->Int{
        return self.amountOfPennies
    }
    
    func getPlayerScored()->[Int]{
        return self.playerScoredInBars
    }
    
    func getPennies()->[Penny]{
        return self.playerPennies
    }
    
    func getcurrPenny()->Int{
        return self.currentPenny
    }
    
    //Setters
    func setAmountofPennies(num:Int){
        self.amountOfPennies = num
    }
    
    func setPlayerScored(bars:[Int]){
        self.playerScoredInBars = bars
    }
    
    func setPennies(pennies:[Penny]){
        self.playerPennies = pennies
    }
    
    func setCurrPenny(newPenny: Int){
        self.currentPenny = newPenny
    }
    

}
