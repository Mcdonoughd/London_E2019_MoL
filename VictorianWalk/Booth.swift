//
//  Booth.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This holds a Booth's or Display's sidebar data
struct Booth{
    
    private var id = 0 //Booth's ID that should be the same as the button label
    private var desc = ""
    private var title = ""
    private var hasActivity = false //determines if the booth has an activity
    
    
    init(id: Int, desc: String, title: String){
        self.id = id
        self.desc = desc
        self.title = title
    }

    init(id: Int, desc: String, title: String,hasActivity: Bool){
        self.id = id
        self.desc = desc
        self.title = title
        self.hasActivity = hasActivity
    }
    
    //Getters
    func getID()->Int{
        return id
    }
    
    func getDesc()->String{
        return desc
    }
    
    func getTitle()->String{
        return title
    }
    
    func getActivity()->Bool{
        return hasActivity
    }
    
    //Setters
    mutating func setID(id: Int){
        self.id = id
    }
    
    mutating func setDesc(desc: String){
        self.desc = desc
    }
    
    mutating func setTitle(title: String){
        self.title = title
    }
    
    mutating func setHasActivity(hasActivity: Bool){
        self.hasActivity = hasActivity
    }
}
