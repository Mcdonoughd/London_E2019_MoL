//
//  PubViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//


import UIKit
import SpriteKit

class PubViewController: UIViewController {
    
    
    @IBOutlet var PubActivity: SKView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "PubGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
//        if let scene = SKScene(fileNamed: "PubGameScene"){
//            // Set the scale mode to scale to fit the window
//            scene.scaleMode = .aspectFill
//
//            // Present the scene
//            print("Trying to present Pub Activity")
//            PubActivity.presentScene(scene)
//            print("Pub Activity presented hopefully")
//        }
        print("PubViewController has loaded...")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
