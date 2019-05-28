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
    
    var passedBooth = Booth(id:0,desc:"",title:"",Activities: [.none])
    var ActivityModel =  TextActivityModel()
    
    @IBOutlet weak var ButtonStack: UIStackView!
    @IBOutlet weak var ActivityTitle: UILabel!
    @IBOutlet weak var Backbutton: UIButton!
    @IBOutlet weak var Helpbutton: UIButton!
    //fucntion called when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Text View Controller has Loaded")
        print("Passed data for \(passedBooth.title)")
        ActivityTitle.text = passedBooth.title
        LoadButtons(boothData: passedBooth)
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
            //Load old map
        //Note keep a boolean to check the layout of the stroyboard
    }
    
    
    func LoadButtons(boothData: Booth){
        for Activity in boothData.Activities {
            if (Activity == .none) {
                //Print error message
            }
            
            
            //Make a button
            MakeButton(DisplayText: Activity.toString() )
        }
    }
    
    
    func MakeButton(DisplayText: String){
        let button = UIButton(frame: CGRect(x:100, y:100,width:10,height:10))
        button.setTitle(DisplayText, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(DisplayActivity), for: .touchUpInside)
        
        ButtonStack.addArrangedSubview(button)
        print("Button Added: \(DisplayText)")
    }
    
    
    @objc func DisplayActivity(){
        // change the text on the jam
        
        //remove buttons on the stack
        //add a label
        
        
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

