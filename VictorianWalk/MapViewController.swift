//
//  MapControllerViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit
import AVFoundation

//This is the controller for the Map View
class MapViewController: UIViewController, AVAudioRecorderDelegate {
   
    //The model that handles most large changes
    var Map = MapModel()
    
    //reference to the MainStoryBoards
    let MyStoryBoard = UIStoryboard(name:"Main",bundle: nil)
    
    lazy var controller = MyStoryBoard.instantiateViewController(withIdentifier: "PubView")
    
 
    //Array of all buttons
    @IBOutlet var MapButtons: [UIButton]!
    
    @IBOutlet var selectors: [UIImageView]!
    //Title Label reference
    @IBOutlet weak var TitleLabel: UILabel!
    
    //Description reference
    @IBOutlet weak var DesciptionLabel: UILabel!
    
    //PlayGameButton refference
    @IBOutlet weak var PlayGameButton: UIButton!
    

    //Function called on "Play" btn press
    // it launches the choose activity segue
    @IBAction func LaunchTextActivity(_ sender: Any) {
         print("Performing segue")
        
         self.performSegue(withIdentifier: "ActivitySegue", sender: self)
    }
    
    //Function called on Map Button Press
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        print("button pressed was \(String(describing: sender.titleLabel?.text))")
        
        let btnPressed = sender.titleLabel?.text ?? "0"
        UpdateViewfromModel(key: btnPressed)
    }
    
    //This passes the data if the segue is to Activitychooser
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ActivitySegue"){
            print("preparing...")
            let vc = segue.destination as! ActivityViewController
            vc.passedBooth = Map.currentBooth.id
        }
    }
    
    //Update the view
    func UpdateViewfromModel(key: String){
        
        let button = Map.chooseBooth(at: key)
        print(button.title)
        
        for selectImage in selectors{
            if(selectImage.tag == Int(key)){
                selectImage.isHidden = false
                
                UIImageView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse, .beginFromCurrentState], animations: {
                    //var x = 0.0
                    //x = x + 15
                    selectImage.transform = CGAffineTransform(rotationAngle: CGFloat(90))
                }, completion: { finished in
                    print("animation started opened!")
                })
                
            }else{
                selectImage.isHidden = true
            }
        }
        
        TitleLabel.text = button.title
        TitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        DesciptionLabel.text = button.desc
        let showbutton = button.hasActivity
        PlayGameButton.isHidden = showbutton ? false : true
        print("play game button is hidden: \(PlayGameButton.isHidden)")
    }
    
    //fucntion called when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller has Loaded")
        TitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        for button in MapButtons{
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
        }

        for selectImage in selectors{
            selectImage.isHidden = true;
        }
        
    }
    
    
    //force landscape mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
   
    
}
