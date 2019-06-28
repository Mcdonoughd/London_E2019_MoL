//
//  Activity.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 30/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation


//This is the Parent Class of all Activities
//This class holds the text information of a TextActivity (ie ACT or SEARCH)

class Activity{
    private var name = ""
    private var type = ""
    private var text = "" //This is the activity dialauge or question, or game description
    
    init(name: String, type:String, text:String){
        self.name=name
        self.type=type
        self.text=text
    }
    
    //Getters
    func getName()->String{
        return self.name
    }
    
    func getType()->String{
        return self.type
    }
    
    func getText()->String{
        return self.text
    }

    
    //Setters
    func setName(name: String){
        self.name = name
    }
    
    func setType(type: String){
        self.type = type
    }
    
    func setText(text: String){
        self.text = text
    }
}
