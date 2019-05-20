//
//  MapControllerViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    @IBAction func PubButtonPressed(_ sender: UIButton) {
        
    
        print("button pressed \(String(describing: sender.titleLabel?.text))")
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller has Loaded")
        
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