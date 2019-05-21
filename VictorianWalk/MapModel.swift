//
//  MapModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This handles what text to be displayed when
class MapModel{
    
    var TitleDesc:[String:Booth] = [
        "1":Booth(desc:"",title:"Toy Shop"),
        "2":Booth(desc:"",title:""),
        "3":Booth(desc:"",title:""),
        "4":Booth(desc:"",title:""),
        "5":Booth(desc:"",title:""),

        "6":Booth(desc:"",title:""),
        "7":Booth(desc:"",title:""),
        "8":Booth(desc:"",title:""),
        "9":Booth(desc:"",title:""),
        "10":Booth(desc:"",title:""),

        "11":Booth(desc:"",title:""),
        "12":Booth(desc:"",title:""),
        "13":Booth(desc:"",title:""),
        "14":Booth(desc:"",title:""),
        "15":Booth(desc:"",title:""),

        "16":Booth(desc:"",title:""),
        "17":Booth(desc:"",title:""),
        "18":Booth(desc:"",title:""),
        "19":Booth(desc:"",title:""),
        "0":Booth(desc:"",title:"EMPTY"),
 ]
    
  
    func chooseBooth(at: String) -> Booth
    {
        print(at)
        return  TitleDesc[at] ?? Booth(desc:"",title:"DUMB")
    }
    
 
}
