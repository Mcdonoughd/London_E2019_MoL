//
//  TextActivityModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 23/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

class TextActivityModel {
//    var TextActivity = TextActivity()
    let errorActivity = "Take a deep breath..."
    
    
    var ActivityLookUp:[Array<String> : String] = [
        ["Bank Manager's Office","Imagine"]:"Say you received a loan from the bank, and you could start any business of your choice. Of the shops you’ve already seen which one would you want to run and why?",
        ["Barber","Act"]:"Play out a scene like you’re inside the barbershop. Act like you’re shaving a family member’s face.",
        ["Barber","Discuss"]:"What do you think the shaving mugs in the cabinet were for?",
        ["Tea & Coffee Warehouse","Imagine"]:"Where else is tea sold in the gallery?",
        ["Engraver","Imagine"]:"Engravers commonly used glass and copper. Is one material better than the other for engraving?",
        ["Grocer","Imagine"]:"How is the grocer similar to a store you’d go to today? How is it different? Find and discuss the differences.",
        ["Pawnbroker","Imagine"]:"Pick an object and make up a story about it. Who did it belong to? Why did they sell it?",
        ["Pawnbroker","Search"]:"Can you spot the following items? \n Three pocket watches \n  Silver cutlery \n Drinking glasses"
    ]
    
    func getActivityText(key:Array<String>) -> String{
        return ActivityLookUp[key] ?? errorActivity
    }
    
    
    
}
