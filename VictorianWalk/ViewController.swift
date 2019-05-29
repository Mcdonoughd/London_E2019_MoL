//
//  ViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 19/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BeginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BeginButton.layer.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        BeginButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BeginButton.layer.borderWidth = 2
        
        // Do any additional setup after loading the view.
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

