//
//  TextActivityModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//this is the model that handles the activity loading
class ActivityModel {
    
 //this is the activity lookup table
    let ActivityLookUp:[Int:[Activity]] = [
        1:[
            TextActivity(name:"Toy Shop",type:"Search",text: "Can you find the following objects? \n Skittles \n Two lobsters \n Balancing scale ")],
        3:[
            TextActivity(name:"Barber Shop",type:"Act",text: "Play out a scene like you’re inside the barbershop. Act like you’re shaving a family member’s face."),
            QuizActivity(name:"Barber Shop",type:"Quiz",question:"What do you think the shaving mugs in the cabinet were for?",answer:" CORRECT! The barber would pour shaving cream in the mug and mix it to build up a lather.",choices: ["To feed the dogs","Build up a lather","Store tea & coffee"],answerIndex:1)
        ],
        4:[ GameActivity(name:"Pub",type:"Game",segueRef:"PubGameSegue",desc:"Description of How to Play")],
        5:[
            TextActivity(name:"Glass Showroom",type:"Search",text:"Can you spot 12 different coloured glasses?"),
            TextActivity(name:"Glass Showroom",type:"Imagine",text:"Can you spot any types of glasses you might find at home?"),
        ],
        6:[TextActivity(name:"Barrel Organ",type:"Search",text:"Can you find the blue and red space invaders from 2016? (Hint: Look Up!) You may find similar art across London today!")],
        7:[
            TextActivity(name:"Tea & Coffee Warehouse",type:"Imagine",text:"Look at different shops. Where else might tea be sold around town?"),
            QuizActivity(name:"Tea & Coffee Warehouse",type:"Quiz",question:"How much tea did the average Londoner drink in Victorian times?",answer:"Correct! Londers would drink ~300-500 cups/year in Victorian times. In comparison, modern Londoners will drink about 550 cups of tea a year",choices:["~1000-1200 bags/year","~600-800 bags/year","~300-500 bags/year"],answerIndex:2),
        ],
        8:[
            QuizActivity(name:"Engraver",type:"Imagine",question:"Engravers commonly used wood and copper. Is one material better than the other for engraving? Discuss with your family what the differences might be between wood and copper",answer:"Engravers used copper to make master prints for copying small cards. They used wood to create newspapers and almanacs"),
            QuizActivity(name:"Engraver",type:"Quiz",question:"Based on the description, how might the Engraver help the Fancy Stationer nearby?",answer:"The engraver might make templates for business cards and holiday cards and sell the cards to the Stationer to put in their shop.",choices:["Make Pens","Make a wedding ring","Make templates for cards"],answerIndex:2),
        ],
        12:[
            TextActivity(name:"Grocer",type:"Imagine",text:"How is the grocer similar to a shop you’d go to today? How is it different? Find and discuss the differences."),
            QuizActivity(name:"Grocer",type:"Quiz",question:"When do you think the busiest day was for the Grocer?",answer:"Saturdays tended to be the busiest because that was when workers were paid their weekly wages.",choices:["Saturdays","Mondays","Fridays"],answerIndex:0)
        ],
        17:[
            TextActivity(name:"Pawnbroker",type:"Imagine",text: "Pick an object and make up a story about it. Who did it belong to? Why did they sell it?"),
            TextActivity(name:"Pawnbroker",type:"Search",text: "Can you spot the following items? \n Three pocket watches \n  Silver cutlery \n Drinking glasses"),
            QuizActivity(name:"Pawnbroker",type:"Quiz",question:"How much money do you think the pawnbroking industry made annually?", answer: "8 million pounds; which today would be equivalent to well over 900 million pounds. With that much business, the pawnbrokers played an important role in the working class economy", choices: ["£10 Thousand","£8 Million","£15 Trillion"],answerIndex:1)
        ],
        19:[
            TextActivity(name:"Bank Manager's Office",type:"Imagine",text:"Say you received a loan from the bank, and you could start any business of your choice. Of the shops you’ve already seen which one would you want to run and why?"),
            QuizActivity(name:"Bank Manager's Office",type:"Quiz",question:"What fictional character was a money-lender? (Hint: They appear in a Christmas themed book by Charles Dickens)",answer:"Ebenezer Scrooge",choices:["Ebenezer Scrooge","Paddington Bear","Harry Potter"],answerIndex:0)]
        ]
    
    let errorActivity = TextActivity(name:"ERROR",type:"ERROR",text:"Take a deep breath...")
    
    var cachedActivities = [Activity]()
   
    //get the list of activities from the given booth ID
    func getActivities(key:Int) -> [Activity] {
        cachedActivities = ActivityLookUp[key] ?? [errorActivity]
        return cachedActivities
    }
    
    func searchCache(type:String) -> Activity{
        for activity in cachedActivities{
            if activity.type == type{
                return activity
            }
        }
        return errorActivity
    }
    
}
