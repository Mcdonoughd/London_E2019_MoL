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
    private var hasGone = false
 
    
    init(){
        let texture = SKTexture(imageNamed: "hapenny")
        super.init(texture: texture,color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0),size: texture.size())
        self.name = "penny"
        self.physicsBody = SKPhysicsBody(texture: texture,size: texture.size())
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.zPosition = 1
        self.xScale = 0.5
        self.yScale = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        //self.physicsBody?.removeObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>)
        self.constraints?.removeAll()
        removeAllActions()
        removeAllChildren()
        removeFromParent()
        texture = nil
        print("Penny has been deallocated")
    }
    
    
    func getGone()->Bool{
        return hasGone
    }
    
    func setGone(gone:Bool){
        self.hasGone = gone
    }
}
