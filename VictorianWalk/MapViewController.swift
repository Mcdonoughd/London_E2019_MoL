//
//  MapControllerViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

//This is the controller for the Map View
class MapViewController: UIViewController {
    
    //The model
    var Map = MapModel()
    
    //reference to the MainStoryBoards
    let MyStoryBoard = UIStoryboard(name:"Main",bundle: nil)
    
    lazy var controller = MyStoryBoard.instantiateViewController(withIdentifier: "PubView")
    
    //Array of all buttons
    @IBOutlet var MapButtons: [UIButton]!
    
    //Title Label reference
    @IBOutlet weak var TitleLabel: UILabel!
    
    //Description reference
    @IBOutlet weak var DesciptionLabel: UILabel!
    
    //PlayGameButton refference
    @IBOutlet weak var PlayGameButton: UIButton!
    
    @IBAction func LaunchTextActivity(_ sender: Any) {
        print("Performing segue")
        //MyStoryBoard.instantiateViewController(withIdentifier: "TextActivityView")
        performSegue(withIdentifier: "TextActivityView", sender: self)
    }
    //Function called on Map Button Press
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        print("button pressed was \(String(describing: sender.titleLabel?.text))")
        
        let btnPressed = sender.titleLabel?.text ?? "0"
        
        UpdateViewfromModel(key: btnPressed)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing...")
    let vc = segue.destination as! TextViewController
        vc.passedBooth = Map.currentBooth
    }
    
    
    //Update the view
    func UpdateViewfromModel(key: String){
        
        let button = Map.chooseBooth(at: key)
        print(button.title)
        
        TitleLabel.text = button.title
        DesciptionLabel.text = button.desc
        let showbutton = button.hasActivity()
        print("Show button is : \(showbutton)")
        PlayGameButton.isHidden = showbutton ? false : true
        
        //Change the button link depending on what booth was picked
//        switch button.hasGame {
//
//            case .pub:
//               controller = MyStoryBoard.instantiateViewController(withIdentifier: "PubView")
//                break;
//
//            case .pharmacy:
//                controller = MyStoryBoard.instantiateViewController(withIdentifier: "PharmacyView")
//                break;
//
//            case .engraver:
//                controller = MyStoryBoard.instantiateViewController(withIdentifier: "EngraverView")
//                break;
//
//            default:
//                print("ERROR")
//        }
        
    }
    
    //fucntion called when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller has Loaded")
        
        for button in MapButtons{
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
            
        }
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
}
