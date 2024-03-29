//
//  TextViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

//This is the controller for the Map View
class ActivityViewController: UIViewController {
    
    let ChooseAnActivity = "Choose An Activity"
    //has an activity been chosen
    var ActivityChosen = false
    
    //temp button stack to hold prev data
    var tempButtonStack = [UIButton]()
    
    //passedBooth data
    var passedBooth = 0
    
    //model reference
    var myActivityModel = ActivityModel()
    
    var tempAnswer = ""
    var tempSegue = ""
    
    
    @IBOutlet weak var ActivityText: UILabel!
    @IBOutlet weak var ButtonStack: UIStackView!
    @IBOutlet weak var ActivityTitle: UILabel!
    @IBOutlet weak var Backbutton: UIButton!
    @IBOutlet weak var Helpbutton: UIButton!
   
    //fucntion called when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Text View Controller has Loaded")
        print("Passed data for Booth \(passedBooth)")
        
        ButtonStack.isHidden = false
        //Make button stack fill equally
        ButtonStack.distribution = .fillEqually
    
        let activityList = myActivityModel.getActivities(key:passedBooth)
        
        //Set the title to the name of the booth
        ActivityTitle.text = activityList[0].getName()
        
        //Load Buttons based on equivalent activities
        LoadButtons(ActivityData:activityList)
    }
    
    //On Back button press
    @IBAction func BackButton(_ sender: UIButton) {
        //if on the activity screen (ie QUIZ, ACT, GAME)
        if(ActivityChosen){
            ActivityChosen = false
            ActivityText.text = ChooseAnActivity //reset Activity text
            ButtonStack.isHidden = false
            ClearButtonStack()
            reloadStackArray()
        }
        //if no activity is chosen then launch the map
        else{
             self.performSegue(withIdentifier: "MapSegue", sender: self)
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MapSegue"){
            print("preparing...")
            _ = segue.destination as! MapViewController
            
            UIView.transition(with: self.view, duration: 0.325, options: .transitionFlipFromTop, animations: {
                
                // animation
                
            })
        }
    }
    
    
    //Removes all buttons on the Current Stack and replaces them with the Activity Buttons
    func reloadStackArray(){
        print("Reloading Stack Array")
        for button in tempButtonStack{
            ButtonStack.addArrangedSubview(button)
            ButtonStack.setCustomSpacing(20,after: button)
        }
    }
    
    
    //On ActivityChoose screen load a button for each of the buttons
    func LoadButtons(ActivityData: [Activity]){
        
        for Activity in ActivityData {
            //error check
            if (Activity.getName() == "ERROR") {
                //Print error message
                print("Error: Chosen Booth does not have any corresponding activities")
            }
            //Make a button
            
            MakeButton(DisplayText: Activity.getType())
        }
    }
    
    //This makes a Choose Activity button
    func MakeButton(DisplayText: String){
   
        let button = MakeGenericButton(text: DisplayText)
        button.addTarget(self, action: #selector(DisplayActivity(sender:)), for: .touchUpInside)
        
        //Add button to stackView
        ButtonStack.addArrangedSubview(button)
        ButtonStack.setCustomSpacing(20,after: button)
        
        //Add button to temp Array
        tempButtonStack.append(button)
        
        print("Button Added: \(DisplayText)")
    }
    
    
    //when Activity Button is clicked
    @objc func DisplayActivity(sender: UIButton!){
        ActivityChosen = true
        
        let Activity = myActivityModel.searchCache(type: sender.titleLabel!.text ?? "Imagine")
        
        switch(Activity){
            case is QuizActivity:
                print("Loading Quiz...")
                let newActivity = Activity as! QuizActivity
                ActivityText.text = newActivity.getText()
                ClearButtonStack()
                if(newActivity.hasChoices()){
                    //make Multiple choice button
                    LoadChoices(quiz: newActivity)
                }
                else{
                    //make a simple show button
                    MakeShowButton(answer: newActivity.getAnswer())
                }
                
                break;
            
            case is GameActivity:
                print("Loading Game...")
                let newActivity = Activity as! GameActivity
                ActivityText.text = newActivity.getText()
                tempSegue = newActivity.getSegueRef()
                ClearButtonStack()
                MakeToGameButton()
                //Load the segue to the game
                break;
            
            //If text activity
            default:
                print("Loading Text Activity...")
                let newActivity = Activity; //cast Activity to TextActivity
                ActivityText.text = newActivity.getText()
                break;
        }
    }
    
    //Makes a button that launches the next game
    func MakeToGameButton(){
        let button = MakeGenericButton(text: "Play")
        button.addTarget(self, action: #selector(LaunchPubGame(sender:)), for: .touchUpInside)
        ButtonStack.addArrangedSubview(button)
        ButtonStack.setCustomSpacing(20,after: button)
    }
    
    //Launch the game activity
    @objc func LaunchPubGame(sender: UIButton){
        print("Launching Pub Game...")
        self.performSegue(withIdentifier: tempSegue, sender: self)
    }
    
    //Load quiz choices
    func LoadChoices(quiz: QuizActivity){
        ClearButtonStack()
        for choice in quiz.getChoices().indices{
            let isAnswer = choice == quiz.getAnswerIndex() //check if this is the correct answer
            MakeMultiChoiceButtons(choice: quiz.getChoices()[choice],answer: isAnswer)
        }
        tempAnswer = quiz.getAnswer()
    }
    
    
    //Make multiple choice buttons
    func MakeMultiChoiceButtons(choice: String,answer: Bool){
      
        let button = MakeGenericButton(text: choice)
        
        if(answer){
          //if the answer is correct then...
          button.addTarget(self, action: #selector(ShowAnswer(sender:)), for: .touchUpInside)
        }
        else{
            button.addTarget(self, action: #selector(WrongAnswer(sender:)), for: .touchUpInside)
        }
        ButtonStack.addArrangedSubview(button)
        ButtonStack.setCustomSpacing(20,after: button)
    }
    
    @objc func WrongAnswer(sender: UIButton){
        print("Wrong Answer! >:( ")
        sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        sender.setTitle("Try Again", for: .normal)
    }
    
    //This function removes all subviews from the button stack
    func ClearButtonStack(){
        for subView in ButtonStack.subviews as [UIView]{
            subView.removeFromSuperview()
        }
    }
    
    //This makes a simple "Show Answer Button on a quiz"
    func MakeShowButton(answer:String){
        ClearButtonStack()
        let button = MakeGenericButton(text: "Show Answer")
        button.addTarget(self, action: #selector(ShowAnswer(sender:)), for: .touchUpInside)
        tempAnswer = answer
        ButtonStack.addArrangedSubview(button)
    }
    
    //Show answer on Showbutton
    @objc func ShowAnswer(sender:UIButton){
        print("Good Answer!")
        ActivityText.text = tempAnswer
        ButtonStack.isHidden = true
    }
    
    //Help Button Action
    @IBAction func HelpButton(_ sender: Any) {
        let alert = UIAlertController(title: "Need help?", message: "Select an activity at the bottom of the screen!\n\nAct: Live life as a Victorian through your actions!\n\nSearch: Find Victorian artefacts in the shops!\n\nImagine: Use your imagination to live back in Victorian London!\n\nQuiz: Test your knowledge of the Victorian era!\n\nPress back when you are finished", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    //Force Landscape mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    //Make generic buttons for Quiz Game
    func MakeGenericButton(text: String) -> UIButton{
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:100, y:100,width:50,height:50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(26)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.numberOfLines = 3
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }
    
    
    
}

