//
//  TextActivityModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

class ActivityModel {
//    var TextActivity = TextActivity()
    let errorActivity = TextActivity(text:"Take a deep breath...")
    
    var ActivityLookUp:[Array<String> : TextActivity] = [
        ["Bank Manager's Office","Imagine"]:TextActivity(text:"Say you received a loan from the bank, and you could start any business of your choice. Of the shops you’ve already seen which one would you want to run and why?"),
        ["Bank Manager's Office","Quiz"]:TextActivity(text:"What fictional character was a money-lender? (Hint: They appear in a Christmas themed book by Charles Dickens)",answer:"Ebenezer Scrooge"),
        ["Barber Shop","Act"]: TextActivity(text: "Play out a scene like you’re inside the barbershop. Act like you’re shaving a family member’s face."),
        ["Barber Shop","Quiz"]:TextActivity(text:"What do you think the shaving mugs in the cabinet were for?",answer:"The barber would pour shaving cream in the mug and mix it to build up a lather."),
        ["Tea & Coffee Warehouse","Imagine"]:TextActivity(text:"Look at different shops. Where else might tea be sold around town?"),
        ["Tea & Coffee Warehouse","Quiz"]:TextActivity(text:"How much tea did the average Londoner drink in Victorian times?",answer:"1 pound/year (~150-250 bags/year) In comparison, modern Londoner’s will drink about 550 cups of tea a year"),
        ["Glass Showroom","Search"]:TextActivity(text:"How many different colored glasses can you spot?"),
        ["Glass Showroom","Imagine"]:TextActivity(text:"What kinds of glasses like these would you find in your own home?"),
        ["Engraver","Imagine"]:TextActivity(text:"Engravers commonly used wood and copper. Is one material better than the other for engraving?",answer:"They each have their purposes. Engravers used copper to make master prints for copying small cards. They used wood to create newspapers and almanacs"),
        ["Engraver","Quiz"]:TextActivity(text:"Based on the description, how might the Engraver help the Fancy Stationer nearby?",answer:"The engraver might make templates for business cards and holiday cards and sell the cards to the Stationer to put in their shop."),
        ["Grocer","Imagine"]:TextActivity(text:"How is the grocer similar to a shop you’d go to today? How is it different? Find and discuss the differences."),
        ["Grocer","Quiz"]:TextActivity(text:"When do you think the busiest day was for the Grocer?",answer:"Saturdays tended to be the busiest because that was when workers were paid their weekly wages."),
        ["Pawnbroker","Imagine"]:TextActivity(text: "Pick an object and make up a story about it. Who did it belong to? Why did they sell it?"),
        ["Pawnbroker","Search"]:TextActivity(text: "Can you spot the following items? \n Three pocket watches \n  Silver cutlery \n Drinking glasses"),
        ["Pawnbroker","Quiz"]:TextActivity(text:"How much money do you think the pawnbroking industry made annually?", answer: "8 million pounds; which today would be equivalent to well over 900 million pounds. With that much business, the pawnbrokers played an important role in the working class economy")
    ]
    
    func getActivityText(key:Array<String>) -> TextActivity{
        return ActivityLookUp[key] ?? errorActivity
    }
    
    
    
}
