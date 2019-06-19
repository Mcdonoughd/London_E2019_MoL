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

class PubViewController: UIViewController, GameViewControllerDelegate {
    
    
    //@IBOutlet var PubActivity: SKView!
    
    weak var MyView: SKView?
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backFunc(_ sender: UIButton) {
        print("Going back to pub activity selection")
        //PubGame.delete(PubGame)
        //PubGame = SKView()
        
        //PubGame = nil
        funcGoBack()
        //self.PubGame.
    }
    
    func funcGoBack(){
        MyView?.presentScene(nil)
        self.performSegue(withIdentifier: "PubToActivity", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PubToActivity"){
            print("preparing...")
            let vc = segue.destination as! ActivityViewController
            vc.passedBooth = 4
            
            UIView.transition(with: self.view, duration: 0.325, options: .transitionFlipFromTop, animations: {
                
                // animation
            })
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Load the SKScene from 'GameScene.sks'
            print("trying to load PubGameScene")
            if let view = self.view as! SKView?{
                if let scene = SKScene(fileNamed: "PubActivityScene") {
                    let gameScene = scene as! PubActivityScene
                    gameScene.gameViewControllerDelegate = self
                    gameScene.scaleMode = .aspectFill
                    print("Loaded scene PubActivityScenes")
                    // Present the scene
                    
                    MyView = view
                    
                    view.ignoresSiblingOrder = true
                    //view = true
                    //view = true
                    view.presentScene(gameScene)
                }
            }
    
        print("PubViewController has loaded...")
    }
    
    
    //force landscape mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    func callMethod(inputProperty:String) {
        print("inputProperty is: ",inputProperty)
    }
    
}
