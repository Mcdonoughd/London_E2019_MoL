//
//  PubActivityScene.swift
//  VictorianWalk
//

//  Created by Museum of London on 21/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//


import SpriteKit

class PubActivityScene: SKScene {
    
    
    var PubGame = pubGame(numberOfRounds: 1, numberOfPennies: 3, numberOfPlayers: 2)
    var label:SKLabelNode!
    var bars = [SKShapeNode]()
    var playArea:SKShapeNode!
    
    override func didMove(to view: SKView) {
//        label = SKLabelNode(fontNamed: "Chalkduster")
//        label.fontSize = 45
//        label.text = "Shove Ha'penny will be here"
//        label.fontColor = SKColor.red
//        label.fontName = "Avenir"
//        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
//        //backgroundColor = UIColor.red
        //bars = [SKShapeNode]()

        self.addChild(PubGame.PlayersArray[0].playerPennies[0])
        loadBars()
        print("We made it")
        
        //self.addChild(penny)
        //self.addChild(label)
        
        //playArea = self.childNode(withName: "playArea") as? SKShapeNode
        
        let background = SKSpriteNode(imageNamed: "woodbg")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        
        let canvasSize = CGSize(width: size.width, height: size.height)
        background.scale(to: canvasSize)
        addChild(background)
        //addChild(penny)
        //penny = self.childNodeWithName("penny") as? SKSpriteNode
        PubGame.currentGameState = pubGame.gamestates.OPENING
    }
    
    //var isFingerOnPenny = false
    //var touchedGlowNode : SKNode!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            PubGame.PlayersArray[0].playerPennies[0].position.x = location.x
            PubGame.PlayersArray[0].playerPennies[0].position.y = location.y
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            let old_posX = PubGame.PlayersArray[0].playerPennies[0].position.x
            let old_posY = PubGame.PlayersArray[0].playerPennies[0].position.y
            
            PubGame.PlayersArray[0].playerPennies[0].position.x = location.x
            PubGame.PlayersArray[0].playerPennies[0].position.y = location.y
            
//            if(penny.intersects(playArea) == false){
//                penny.position.x = old_posX
//                penny.position.y = old_posY
//            }
            
        }
    }
    
    //186!
    
    override func update(_ currentTime: TimeInterval) {
        switch PubGame.currentGameState{
            case pubGame.gamestates.OPENING:
                var currentTime = Date().toMillis()
                PubGame.currentGameState = pubGame.gamestates.PLAYING
            case pubGame.gamestates.PLAYING:

            case pubGame.gamestates.CLOSING:
        }
    }
    
    func loadBars(){
        
        var bar:SKShapeNode!
        
        for index in 1...10{
            bar = self.childNode(withName: "Bed Line " + String(index)) as? SKShapeNode
            bars.append(bar);
            
        }
        
        
        for testBar in bars{
            print(testBar.name!)
        }
    }
    
}


