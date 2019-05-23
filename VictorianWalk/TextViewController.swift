//
//  TextViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

//This is the controller for the Map View
class TextViewController: UIViewController {
    
    @IBOutlet weak var ActivityTitle: UILabel!
    @IBOutlet weak var Backbutton: UIButton!
    @IBOutlet weak var Helpbutton: UIButton!
    //fucntion called when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Text View Controller has Loaded")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

