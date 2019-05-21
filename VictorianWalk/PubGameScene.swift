//
//  PubGameScene.swift
//  VictorianWalk
//
//  Created by Museum of London on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import SpriteKit

class PubGameScene: SKScene {
    
    let label = SKLabelNode(text: "Yeetus")
    
    override func didMove(to view: SKView) {
        label.fontSize = 45
        label.fontColor = SKColor.red
        label.fontName = "Avenir"
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        
        addChild(label)

    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
