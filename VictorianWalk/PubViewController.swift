//
//  PubViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit

class PubViewController: UIViewController {
    
    
    //@IBOutlet var PubActivity: SKView!
    
    @IBOutlet weak var PubGame: SKView!
    
    var testView: SKView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backFunc(_ sender: UIButton) {
        print("Going back to pub activity selection")
        //PubGame.delete(PubGame)
        //PubGame = SKView()
        
        //PubGame = nil
        self.performSegue(withIdentifier: "PubToActivity", sender: self)
        //self.PubGame.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PubToActivity"){
            print("preparing...")
            let vc = segue.destination as! ActivityViewController
            vc.passedBooth = 4
            
            UIView.transition(with: self.view, duration: 0.325, options: .transitionFlipFromTop, animations: {
                
                // animation
            })
            
            didReceiveMemoryWarning()
            viewWillDisappear(true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        self.PubGame.presentScene(nil)
//        self.PubGame.scene?.removeAllChildren()
//        self.PubGame.scene?.removeAllActions()
//        self.PubGame.scene?.removeFromParent()
//      //  PubGame.scene?.set
//
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            // Load the SKScene from 'GameScene.sks'
            print("trying to load PubGameScene")
            if let scene = SKScene(fileNamed: "PubActivityScene") {
                //let scene = SKScene(fileNamed: "PubActivityScene")!
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                print("Loaded scene PubActivityScenes")
                // Present the scene
            
                
                PubGame.ignoresSiblingOrder = true
                PubGame.showsFPS = true
                PubGame.showsNodeCount = true
                PubGame.presentScene(scene)
                
                
//                testView = SKView()
//                testView.ignoresSiblingOrder = true
//                
//                testView.showsFPS = true
//                testView.showsNodeCount = true
//                testView.presentScene(scene)
            
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
    
    
    //force landscape mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
}
