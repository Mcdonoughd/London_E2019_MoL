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
    var amountOfPennies:Int
    var playerScoredInBars:[Int]
    var playerPennies = [Penny]()
    var currentPenny:Int
    
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
       return playerPennies[currentPenny]
    }
    
    func runTurn(){
        currentPenny = currentPenny + 1
    }
}
