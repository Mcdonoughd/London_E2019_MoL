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
    
    var fireFrom = 0
    var currentFirePos = 0
    
    
    //var fireFromY = 0
    
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
    
    override func didMove(to view: SKView) {

        
        placementPenny = Penny()
        placementPenny.name = "placementPenny"
        placing = true
        //Button init
        buttonBackground = self.childNode(withName: "buttonBackground") as? SKSpriteNode
        buttonLabel = self.childNode(withName: "buttonLabel") as? SKLabelNode
        buttonLabel.text = "Place!"
        //Powerbar init
        powerBar = self.childNode(withName: "powerBar") as? SKSpriteNode
        powerLabel = self.childNode(withName: "powerLabel") as? SKLabelNode
        
        backButtonLabel = self.childNode(withName: "backButtonLabel") as? SKLabelNode
        backButtonBackground = self.childNode(withName: "backButtonBackground") as? SKSpriteNode
        
        powerBar.isHidden = true
        powerLabel.isHidden = true
        
        //MAKE PENNIES NOT COLLIDE
        placementPenny.physicsBody?.categoryBitMask = 0
        placementPenny.physicsBody?.collisionBitMask = 0
        
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
            
            
            if(firing == true){
                if(touchedNode.name == "placementPenny"){
                    fireFrom = Int(location.x)
                    currentFirePos = Int(location.x)

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
            let touchedNode = atPoint(location)
            
            //print("Yeet")
            if(firing == true && buttonPushed != true ){
                currentFirePos = Int(location.x)
                
                let ppPosition = placementPenny.position
                //placementPenny.constraints
                
                
                placementPenny.isHidden = true
                
                self.addChild(PubGame.PlayersArray[0].playerPennies[0])
                
                PubGame.PlayersArray[0].playerPennies[0].physicsBody?.contactTestBitMask = 1
                PubGame.PlayersArray[0].playerPennies[0].physicsBody?.collisionBitMask = 1
                PubGame.PlayersArray[0].playerPennies[0].physicsBody?.linearDamping = 0.99
                PubGame.PlayersArray[0].playerPennies[0].position = ppPosition
       
                
                
                PubGame.PlayersArray[0].playerPennies[0].physicsBody?.velocity = CGVector(dx: calcScaledSpeed()*250, dy: 0)
                firing = false
                
            }
            if(buttonPushed == true){
                buttonPushed = false
            }
//            if(touchedNode.name== "buttonLabel"){
//                //placing = false
//                firing = true
////                buttonLabel.text = "Placed"
////                powerBar.isHidden = false
////                powerLabel.isHidden = false
//            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if(firing){
            print("Firing is true")
            
        }
        if(placing){
            print("placing is true")
        }
        
        if(firing){

            powerBar.xScale = calcScaledSpeed()
            
            //print("xScale: " + String(Double(powerBar.xScale)) + "powerScale: " + String(Int(powerScale)))
        }
        
        //print(fireFrom - currentFirePos)
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
    
    func map(minRange:Int, maxRange:Int, minDomain:Int, maxDomain:Int, value:Int) -> Int {
        return minDomain + (maxDomain - minDomain) * (value - minRange) / (maxRange - minRange)
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
    
    func calcScaledSpeed()->CGFloat{
        var power = fireFrom - currentFirePos
        if(power < 0){
            power = 0
        }
        
        //Not entirely sure how map works but it does kinda...
        let powerScale = map(minRange: 0, maxRange: 100, minDomain: 0, maxDomain: 180, value: power)
        
        
        return CGFloat(powerScale)/100
    }
    
}


