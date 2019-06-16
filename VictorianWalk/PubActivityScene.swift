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
    var playArea:SKShapeNode!
    var ActivePenny = Penny()
    
    //on scene Load
    override func sceneDidLoad() {
        //add a penny to the game
        print("Loading Pub Game...")
        ActivePenny = PubGame.PlayersArray[0].playerPennies[0]
        self.addChild(ActivePenny)
        ActivePenny.position.x = 30
        ActivePenny.position.y = 50
        loadBars()
        setBackground()
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchLocation = touch.location(in: self)
            let touchedWhere = nodes(at: touchLocation)
            
            if !touchedWhere.isEmpty{
                for node in touchedWhere{
                    if node is SKSpriteNode{
                        if node == ActivePenny{
                            ActivePenny.position = touchLocation
                        }
                    }
                }
            }
        }
        
        
        for touch in touches{
            let location = touch.location(in: self)
            PubGame.PlayersArray[0].playerPennies[0].position.x = location.x
            PubGame.PlayersArray[0].playerPennies[0].position.y = location.y
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 
    }
    

    override func update(_ currentTime: TimeInterval) {

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


