//
//  MapModel.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 20/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import Foundation

//This handles what text to be displayed when a display is clicked
class MapModel{
    
    var TitleDesc:[String:Booth] = [
        "1":Booth(desc:"",title:"Toy Shop",hasGame:.none),
        "2":Booth(desc:"",title:"Tabaconist",hasGame:.none),
        "3":Booth(desc:"",title:"Barber Shop",hasGame:.none),
        "4":Booth(desc:"",title:"The Pub",hasGame:.pub),
        "5":Booth(desc:"",title:"Glass Showroom",hasGame:.none),

        "6":Booth(desc:"",title:"Barrel Organ",hasGame:.none),
        "7":Booth(desc:"",title:"Tea & Coffee Warehouse",hasGame:.none),
        "8":Booth(desc:"",title:"Engraver",hasGame:.engraver),
        "9":Booth(desc:"",title:"Watchmaker",hasGame:.none),
        "10":Booth(desc:"",title:"public Urinal",hasGame:.none),

        "11":Booth(desc:"",title:"Baker's Cart",hasGame:.none),
        "12":Booth(desc:"",title:"Grocer",hasGame:.none),
        "13":Booth(desc:"",title:"Pharmacy",hasGame:.pharmacy),
        "14":Booth(desc:"",title:"Milliner",hasGame:.none),
        "15":Booth(desc:"",title:"Tailor",hasGame:.none),

        "16":Booth(desc:"",title:"Fancy Stationer",hasGame:.none),
        "17":Booth(desc:"",title:"Pawnbroker",hasGame:.none),
        "18":Booth(desc:"",title:"Bank Clerks' Office",hasGame:.none),
        "19":Booth(desc:"",title:"Bank Manager's Office",hasGame:.none),
        "0":Booth(desc:"",title:"EMPTY",hasGame:.none),
 ]
    
  
    func chooseBooth(at: String) -> Booth
    {
        print(at)
        return  TitleDesc[at] ?? Booth(desc:"Do not panic!!! The devlopers of this application have not accounted for this to happen. We have trained monkey's working on fixing it right now. ",title:"404",hasGame:.none)
    }
    
 
}
