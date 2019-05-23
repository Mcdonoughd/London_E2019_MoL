//
//  PubActivityScene.swift
//  VictorianWalk
//

//  Created by Museum of London on 21/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//


import SpriteKit

class PubActivityScene: SKScene {
    
    var label:SKLabelNode!
    
    override func didMove(to view: SKView) {
//        label = SKLabelNode(fontNamed: "Chalkduster")
//        label.fontSize = 45
//        label.text = "Shove Ha'penny will be here"
//        label.fontColor = SKColor.red
//        label.fontName = "Avenir"
//        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
//        //backgroundColor = UIColor.red
        print("We made it")
        //self.addChild(label)
        
        let background = SKSpriteNode(imageNamed: "woodbg.jpg")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        let canvasSize = CGSize(width: size.width, height: size.height)
        background.scale(to: canvasSize)
        addChild(background)
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


