//
//  Penny.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 31/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation
import SpriteKit

class Penny: SKSpriteNode{
    var hasGone = false
    var isPresent:Int
    
    init(){
        let texture = SKTexture(imageNamed: "hapenny")
        self.isPresent = 0
        super.init(texture: texture,color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0),size: texture.size())
        self.name = "penny"
        self.physicsBody = SKPhysicsBody(texture: self.texture!,size: self.texture!.size())
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.zPosition = 1
        self.xScale = 0.5
        self.yScale = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
