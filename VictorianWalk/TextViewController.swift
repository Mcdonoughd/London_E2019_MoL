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
    
    var ActivityChosen = false //has an activity been chosen
    var tempButtonStack = [UIButton]() //temp button stack to hold prev data
    
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
        
        //Make the title page the same as the chosen booth
        ActivityTitle.text = passedBooth.title
        //Make button stack fill equally
        ButtonStack.distribution = .fillEqually
        //Load Buttons based on equivalent activities
        LoadButtons(boothData: passedBooth)
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
            //Load old map
            //Note keep a boolean to check the layout of the stroyboard
        
        
        //if on the activity screen (ie quiz, act)
        if(ActivityChosen){
            //Load choose an activity screen
            ActivityChosen = false
            ActivityText.text = ChooseAnActivity //reset Activity text
            reloadStackArray()
            //to do reset button stack
            
        }
        //if no activity is chosen then launch the map
        else{
             self.performSegue(withIdentifier: "MapSegue", sender: self)
        }
    }
    
    func reloadStackArray(){
        print("Reloading Stack Array")
        for button in ButtonStack.subviews{
            button.removeFromSuperview()
        }
        
        for button in tempButtonStack{
            ButtonStack.addArrangedSubview(button)
        }
    }
    
    //On ActivityChoose screen load a thing for each of the buttons
    func LoadButtons(boothData: Booth){
        for Activity in boothData.Activities {
            if (Activity == .none) {
                //Print error message
                print("Error: Chosen Booth does not have any corresponding activities")
            }
            //Make a button
            MakeButton(DisplayText: Activity.toString())
        }
    }
    
    //This makes a Choose Activity button
    func MakeButton(DisplayText: String){
        let button = UIButton(type: .custom)
        button.frame = CGRect(x:100, y:100,width:50,height:50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle(DisplayText, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(DisplayActivity(sender:)), for: .touchUpInside)
        
        //Add button to stackView
        ButtonStack.addArrangedSubview(button)
        ButtonStack.customSpacing(after: button)
        
        //Add button to temp Array
        tempButtonStack.append(button)
        
        print("Button Added: \(DisplayText)")
    }
    
    
    //when Activity Button is clicked
    @objc func DisplayActivity(sender: UIButton!){
        ActivityChosen = true
        
        let ActDesc = ActivityModel.getActivityText(key: [passedBooth.title,sender.titleLabel!.text ?? "Imagine"])
     
        ActivityText.text = ActDesc.text
        
        //If the activity has an answer (IE Imagine or Quiz)
        if ActDesc.answer != "none"{
            MakeShowButton(answer: ActDesc.answer)
            ButtonStack.removeArrangedSubview(sender)
        }
        
    }
    
    var tempAnswer = ""
    
    func MakeShowButton(answer:String){
        for subView in ButtonStack.subviews as [UIView]{
            subView.removeFromSuperview()
        }
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:100, y:100,width:50,height:50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle("Show", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(ShowAnswer(sender:)), for: .touchUpInside)
        tempAnswer = answer
        ButtonStack.addArrangedSubview(button)
    }
    
    @objc func ShowAnswer(sender:UIButton){
        print(tempAnswer)
        ActivityText.text = tempAnswer
        ButtonStack.isHidden = true
    }
    
    
    //Help Button Action
    @IBAction func HelpButton(_ sender: Any) {
        let alert = UIAlertController(title: "Need help?", message: "Select an activity at the bottum of the screen!\n\nAct: Live life as a Victorian through your actions!\n\nSearch: Find Victorian artifacts in the shops\n\nImagine: Use your imagination to live back in Victorian London\n\nDiscuss: Talk about topics and questions from the shop with your family\n\nPress back when you are finished", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    //Secret home button Action
    @IBAction func LaunchHomeActivity(_ sender: UIButton) {
        print("Performing segue")
        self.performSegue(withIdentifier: "ActivitytoHome", sender: self)
    }
}

