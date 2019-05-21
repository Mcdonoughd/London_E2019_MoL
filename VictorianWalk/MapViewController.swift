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
    
    
    //Array of all buttons
    //Assume that they are in order of Booth
    @IBOutlet var MapButtons: [UIButton]!
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        print("button pressed was \(String(describing: sender.titleLabel?.text))")
        
        let btnPressed = sender.titleLabel?.text ?? "0"
        
        
        UpdateViewfromModel(key: btnPressed)
    }
 
    
    func UpdateViewfromModel(key: String){
        
        let button = Map.chooseBooth(at: key)
        print(button.title)
        
        // TODO: Update UI
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller has Loaded")
        
        // TODO: Make buttonss opque
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
