//
//  PubActivityScene.swift
//  VictorianWalk
//

//  Created by Museum of London on 21/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.

import CoreData
import SpriteKit

protocol GameViewControllerDelegate: class {
    func callMethod(inputProperty:String)
}


class PubActivityScene: SKScene {
    weak var gameViewControllerDelegate:GameViewControllerDelegate?
    var PubGame = pubGame(numberOfRounds: 1, numberOfPennies: 3, numberOfPlayers: 2)
    
    var label:SKLabelNode!
    var bars = [SKShapeNode]()
    var playArea:SKSpriteNode!
    
    //State variables
    var placing = false
    var firing = false
    
    weak var movingPenny:Penny!
    var placementPenny:Penny!
    
    var fireFrom = 0
    var currentFirePos = 0
    
    
    //Placement buttons
    var buttonBackground:SKSpriteNode!
    var buttonLabel:SKLabelNode!
    var buttonPushed = false
    
    //Power bars
    var powerBar:SKSpriteNode!
    var powerLabel:SKLabelNode!
    
    //Back button
    var backButtonLabel:SKLabelNode!
    var backButtonBackground:SKSpriteNode!
    
    //HUDisplay
    var playerDisplay:SKLabelNode!
    var pennyDisplay:SKLabelNode!
    var roundDisplay:SKLabelNode!
    
    
    //State Variables
    var pullingBack = false
    var pennyInFlight = false
    
  
    override func didMove(to view: SKView) {

        print("Scene Loaded")
        placementPenny = Penny()
        placementPenny.name = "placementPenny"
        placing = true
        
        MakeHUD()
        
        //MAKE PENNIES NOT COLLIDE
        placementPenny.physicsBody?.categoryBitMask = 0
        placementPenny.physicsBody?.collisionBitMask = 0
        
        placementPenny.zPosition = 2
        self.addChild(placementPenny)
        loadBars()
        
        
        let xPlaceRange = SKRange(lowerLimit: 186, upperLimit: 200)
        let yPlaceRange = SKRange(lowerLimit: 155, upperLimit: 630)
        
        let pennyConstraint = SKConstraint.positionX(xPlaceRange, y: yPlaceRange)

        placementPenny.constraints = [pennyConstraint]
        
        playArea = self.childNode(withName: "playArea") as? SKSpriteNode
        
        setBackground()

    }
    
    //var isFingerOnPenny = false
    //var touchedGlowNode : SKNode!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches{
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            
            if(firing == true){
                if(touchedNode.name == "placementPenny"){
                    fireFrom = Int(location.x)
                    currentFirePos = Int(location.x)
                    pullingBack = true
                }
                
            }
            
            
            if(touchedNode.name == "buttonLabel" && placing == true){
                placing = false
                firing = true
                buttonLabel.text = "Placed"
                powerBar.isHidden = false
                powerLabel.isHidden = false
                buttonPushed = true
            }
            
            if(touchedNode.name == "backButtonLabel"){
                //print("REEEEEEE")
                //self.view?.window?.rootViewController?.present(ActivityViewController(), animated: true, completion: nil)
                
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
            if(firing == true){
                
                currentFirePos = Int(location.x)
            }
//            if(PubGame.PlayersArray[0].playerPennies[0].intersects(playArea) == false){
//                PubGame.PlayersArray[0].playerPennies[0].position.x = old_posX
//                PubGame.PlayersArray[0].playerPennies[0].position.y = old_posY
//            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            //let touchedNode = atPoint(location)
            
            //print("Yeet")
            if(firing == true && buttonPushed != true && pullingBack == true){
                currentFirePos = Int(location.x)
                
                let ppPosition = placementPenny.position
                //placementPenny.constraints
                
                
                placementPenny.isHidden = true
                movingPenny = PubGame.getCurrentPenny()
                
                
                self.addChild(movingPenny)
                
                movingPenny.physicsBody?.contactTestBitMask = 1
                movingPenny.physicsBody?.collisionBitMask = 1
                movingPenny.physicsBody?.linearDamping = 0.99
                movingPenny.physicsBody?.angularDamping = 0.9
                movingPenny.position = ppPosition
       
                
                
                movingPenny.physicsBody?.velocity = CGVector(dx: calcScaledSpeed()*250, dy: 0)
                firing = false
                pullingBack = false
                pennyInFlight = true
            }
            if(buttonPushed == true){
                buttonPushed = false
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
                
        if(firing){
            powerBar.xScale = calcScaledSpeed()
        }
        if(pennyInFlight == true && movingPenny.physicsBody?.velocity.dx == 0 && movingPenny.physicsBody?.velocity.dy == 0){
            placing = true
            pennyInFlight = false
            placementPenny.isHidden = false
            powerBar.isHidden = true
            powerLabel.isHidden = true
            buttonLabel.text = "Place!"
            PubGame.nextTurn() // doesnt check that its still in the amount of pennies there
        }
        
        playerDisplay.text = String(PubGame.currentPlayersTurn)
        pennyDisplay.text = String(PubGame.PlayersArray[PubGame.currentPlayersTurn].currentPenny)
        roundDisplay.text = String(PubGame.currentRound)
    }
    

    //Load the bars into the scene
    func loadBars(){
        var bar:SKShapeNode!
        for index in 1...10{
            bar = self.childNode(withName: "Bed Line " + String(index)) as? SKShapeNode
            bars.append(bar);
        }
//        for testBar in bars{
//            print(testBar.name!)
//        }
    }
    
    func map(minRange:Int, maxRange:Int, minDomain:Int, maxDomain:Int, value:Int) -> Int {
        return minDomain + (maxDomain - minDomain) * (value - minRange) / (maxRange - minRange)
    }
    
    //set background
    func setBackground(){
        //set Wood image to the background
        autoreleasepool {
            let texture = SKTexture(imageNamed: "woodbg")
            let canvasSize = CGSize(width: size.width, height: size.height)
            let background = SKSpriteNode(texture: texture,color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0),size: canvasSize)
           
            background.position = CGPoint(x: size.width/2, y: size.height/2)
            background.zPosition = -1
            
            addChild(background)
            
        
           // gameViewControllerDelegate?.callMethod(inputProperty: "call game view controller method")
        }
    }
    
    func calcScaledSpeed()->CGFloat{
        var power = fireFrom - currentFirePos
        if(power < 0){
            power = 0
        }
        
        //Not entirely sure how map works but it does kinda...
        let powerScale = map(minRange: 0, maxRange: 100, minDomain: 0, maxDomain: 180, value: power)
        
        
        return CGFloat(powerScale)/100
    }
    
    override func willMove(from view: SKView) {
        //self.isPaused = true
    }
    
    
    deinit{
        
        removeAllActions()
        removeAllChildren()
        removeFromParent()
        
        print("Pub Activity Scene has been deallocated")
    }
    
    
  
    
    func MakeHUD(){
        //Placing Button init
        buttonBackground = self.childNode(withName: "buttonBackground") as? SKSpriteNode
        buttonLabel = self.childNode(withName: "buttonLabel") as? SKLabelNode
        buttonLabel.text = "Place!"
        
        //Powerbar init
        powerBar = self.childNode(withName: "powerBar") as? SKSpriteNode
        powerLabel = self.childNode(withName: "powerLabel") as? SKLabelNode
        
        //Back Button Init
        backButtonLabel = self.childNode(withName: "backButtonLabel") as? SKLabelNode
        backButtonBackground = self.childNode(withName: "backButtonBackground") as? SKSpriteNode
        
        //HUD Labels
        playerDisplay = self.childNode(withName: "playerDisplay") as? SKLabelNode
        pennyDisplay = self.childNode(withName: "pennyDisplay") as? SKLabelNode
        roundDisplay = self.childNode(withName: "roundDisplay") as? SKLabelNode
        
        powerBar.isHidden = true
        powerLabel.isHidden = true
    }
    

    
}


