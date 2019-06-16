//
//  PubActivityScene.swift
//  VictorianWalk
//

//  Created by Museum of London on 21/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.


import SpriteKit

class PubActivityScene: SKScene {
    var PubGame = pubGame(numberOfRounds: 1, numberOfPennies: 3, numberOfPlayers: 2)
    var label:SKLabelNode!
    var bars = [SKShapeNode]()
    var playArea:SKSpriteNode!
    
    //State variables
    var placing = false
    var firing = false
    
    
    var placementPenny:Penny!
    
    //Placement buttons
    var buttonBackground:SKSpriteNode!
    var buttonLabel:SKLabelNode!
    
    //Power bars
    var powerBar:SKSpriteNode!
    var powerLabel:SKLabelNode!
    
    
    override func didMove(to view: SKView) {

        
        placementPenny = Penny()
        placing = true
        //Button init
        buttonBackground = self.childNode(withName: "buttonBackground") as? SKSpriteNode
        buttonLabel = self.childNode(withName: "buttonLabel") as? SKLabelNode
        buttonLabel.text = "Place!"
        //Powerbar init
        powerBar = self.childNode(withName: "powerBar") as? SKSpriteNode
        powerLabel = self.childNode(withName: "powerLabel") as? SKLabelNode
        powerBar.isHidden = true
        powerLabel.isHidden = true
        
        
        placementPenny.zPosition = 2
        self.addChild(placementPenny)
        loadBars()
        print("We made it")
        
        let xPlaceRange = SKRange(lowerLimit: 186, upperLimit: 200)
        let yPlaceRange = SKRange(lowerLimit: 155, upperLimit: 630)
        
        let pennyConstraint = SKConstraint.positionX(xPlaceRange, y: yPlaceRange)
        //self.addChild(penny)
        //self.addChild(label)
        placementPenny.constraints = [pennyConstraint]
        
        playArea = self.childNode(withName: "playArea") as? SKSpriteNode
        
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
            
            let touchedNode = atPoint(location)
            if(touchedNode.name == "buttonLabel"){
                placing = false
                buttonLabel.text = "Placed"
                powerBar.isHidden = false
                powerLabel.isHidden = false
            }
            
            if(placing == true){
                //let old_posX = PubGame.PlayersArray[0].playerPennies[0].position.x
                //let old_posY = PubGame.PlayersArray[0].playerPennies[0].position.y
            
                placementPenny.position.x = location.x
                placementPenny.position.y = location.y
            }
//            if(PubGame.PlayersArray[0].playerPennies[0].intersects(playArea) == false){
//                PubGame.PlayersArray[0].playerPennies[0].position.x = old_posX
//                PubGame.PlayersArray[0].playerPennies[0].position.y = old_posY
//            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            if(placing == true){
                //let old_posX = PubGame.PlayersArray[0].playerPennies[0].position.x
                //let old_posY = PubGame.PlayersArray[0].playerPennies[0].position.y
                
                placementPenny.position.x = location.x
                placementPenny.position.y = location.y
            }
//            if(PubGame.PlayersArray[0].playerPennies[0].intersects(playArea) == false){
//                PubGame.PlayersArray[0].playerPennies[0].position.x = old_posX
//                PubGame.PlayersArray[0].playerPennies[0].position.y = old_posY
//            }
            
        }
    }
    

    override func update(_ currentTime: TimeInterval) {
        switch PubGame.currentGameState{
            case pubGame.gamestates.OPENING:
                var currentTime = CACurrentMediaTime()
                PubGame.currentGameState = pubGame.gamestates.PLAYING
                break
            case pubGame.gamestates.PLAYING:
                break
            case pubGame.gamestates.CLOSING:
                break
        }
    }
    

    //Load the bars into the scene
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
    
    //set background
    func setBackground(){
        //set Wood image to the background
        let background = SKSpriteNode(imageNamed: "woodbg")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        
        let canvasSize = CGSize(width: size.width, height: size.height)
        background.scale(to: canvasSize)
        addChild(background)
    }
    
}


