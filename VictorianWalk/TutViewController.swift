//
//  TutViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

class TutViewController: UIViewController {
    
    @IBOutlet weak var ExploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ExploreButton.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        ExploreButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ExploreButton.layer.borderWidth = 2
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

