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
    
    var CurrActivity = ""

    let ChooseAnActivity = "Choose An Activity"
    
    var isShown = false
    
    var passedBooth = Booth(id:0,desc:"",title:"",Activities: [.none])
    var ActivityModel =  TextActivityModel()
    
    @IBOutlet weak var ActivityText: UILabel!
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
        print("Performing segue")
        self.performSegue(withIdentifier: "MapSegue", sender: self)
    }
    
    @IBAction func LaunchHomeActivity(_ sender: UIButton) {
        print("Performing segue")
        self.performSegue(withIdentifier: "ActivitytoHome", sender: self)
    }
    
    //On ActivityChoose screen load a thing for each of the buttons
    func LoadButtons(boothData: Booth){
        for Activity in boothData.Activities {
            if (Activity == .none) {
                //Print error message
                print("Error")
            }
            //Make a button
            MakeButton(DisplayText: Activity.toString())
        }
    }
    
    //this makes a button
    func MakeButton(DisplayText: String){
        let button = UIButton(type: .custom)
        button.frame = CGRect(x:100, y:100,width:50,height:50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle(DisplayText, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(DisplayActivity(sender:)), for: .touchUpInside)
//        let selector = #selector(DisplayActivity(type:DisplayText))
        ButtonStack.addArrangedSubview(button)
        ButtonStack.customSpacing(after: button)
        ButtonStack.distribution = .fillEqually
        print("Button Added: \(DisplayText)")
    }
    
    
    @objc func DisplayActivity(sender: UIButton!){
        //let btnsendtag: UIButton = sender
        
        let ActDesc = ActivityModel.getActivityText(key: [passedBooth.title,sender.titleLabel!.text ?? "Imagine"])
     
        ActivityText.text = ActDesc.text
        
        if ActDesc.answer != "none"{
            MakeShowButton(answer: ActDesc.answer)
            ButtonStack.removeArrangedSubview(sender)
        }
    }
    
    var tempAnswer = ""
    
    func MakeShowButton(answer:String){
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:100, y:100,width:50,height:50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle("Show", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(ShowAnswer(sender:)), for: .touchUpInside)
        tempAnswer = answer; ButtonStack.addArrangedSubview(button)
    }
    
    @objc func ShowAnswer(sender:UIButton){
        print(tempAnswer)
        ActivityText.text = tempAnswer
        ButtonStack.isHidden = true
        
    }
    
    @IBAction func HelpButton(_ sender: Any) {
        let alert = UIAlertController(title: "Need help?", message: "Select an activity at the bottum of the screen!\n\nAct: Live life as a Victorian through your actions!\n\nSearch: Find Victorian artifacts in the shops\n\nImagine: Use your imagination to live back in Victorian London\n\nDiscuss: Talk about topics and questions from the shop with your family\n\nPress back when you are finished", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
}

