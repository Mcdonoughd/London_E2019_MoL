//
//  ViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 19/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

//View controller for the Home Screen
class ViewController: UIViewController {
   
    @IBOutlet weak var BeginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    
    }
    
    
    //This passes the data if the segue is to Activitychooser
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            print("Transitioning screens...")
        
            UIView.transition(with: self.view, duration: 0.325, options: .transitionFlipFromBottom, animations: {
                
                // animation
                
            })
        
            //didReceiveMemoryWarning()
//            viewWillDisappear(true)
//            dismiss(animated: true, completion: nil)
        
    }
    

    //force landscape mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
   
}

