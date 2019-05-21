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
    
    //Function called on Map Button Press
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        print("button pressed was \(String(describing: sender.titleLabel?.text))")
        
        let btnPressed = sender.titleLabel?.text ?? "0"
        
        
        UpdateViewfromModel(key: btnPressed)
    }
 
    
    @IBAction func ToPubGame(_ sender: UIButton) {
        self.present(controller,animated: true, completion: nil)
    }
    
    
    
    //Update the view
    func UpdateViewfromModel(key: String){
        
        let button = Map.chooseBooth(at: key)
        print(button.title)
        
        TitleLabel.text = button.title
        DesciptionLabel.text = button.desc
        let showbutton = button.hasGame == .none
        
        PlayGameButton.isHidden = showbutton ? true : false
        
        switch button.hasGame {
            case .pub:
               controller = MyStoryBoard.instantiateViewController(withIdentifier: "PubView")
                break;
            case .pharmacy:
                
                // TODO LOAD Pharmacy View
                
                break;
            case .engraver:
                
                // TODO Load Engraver View
                
                break
            default:
                print("ERROR")
        }
        
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
}
