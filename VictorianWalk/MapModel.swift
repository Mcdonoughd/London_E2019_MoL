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
    var currentBooth = Booth(id:0,desc:"",title:"",Activities: [.none])
    
    
    var TitleDesc:[String : Booth] = [
        "1":Booth(id:1, desc:"",title:"Toy Shop", Activities: [.none]),
        "2":Booth(id:2, desc:"",title:"Tabaconist", Activities: [.none]),
        "3":Booth(id:3, desc:"",title:"Barber Shop",Activities: [.none]),
        "4":Booth(id:4, desc:"",title:"The Pub",Activities: [.none]),
        "5":Booth(id:5, desc:"",title:"Glass Showroom",Activities: [.none]),

        "6":Booth(id:6, desc:"",title:"Barrel Organ",Activities: [.none]),
        "7":Booth(id:7, desc:"",title:"Tea & Coffee Warehouse",Activities: [.none]),
        "8":Booth(id:8, desc:"",title:"Engraver",Activities: [.none]),
        "9":Booth(id:9, desc:"",title:"Watchmaker",Activities: [.none]),
        "10":Booth(id:10, desc:"",title:"Public Urinal",Activities: [.none]),

        "11":Booth(id:11, desc:"",title:"Baker's Cart",Activities: [.none]),
        "12":Booth(id:12, desc:"",title:"Grocer",Activities: [.none]),
        "13":Booth(id:13, desc:"",title:"Pharmacy",Activities: [.none]),
        "14":Booth(id:14, desc:"",title:"Milliner",Activities: [.none]),
        "15":Booth(id:15,desc:"",title:"Tailor",Activities: [.none]),

        "16":Booth(id:16,desc:"",title:"Fancy Stationer",Activities: [.none]),
        "17":Booth(id:17,desc:"",title:"Pawnbroker",Activities: [.none]),
        "18":Booth(id:18,desc:"",title:"Bank Clerks' Office",Activities: [.none]),
        "19":Booth(id:19,desc:"",title:"Bank Manager's Office",Activities: [.Imagine, .Quiz])
 ]
    
  let errorBooth = Booth(id:0, desc:"Do not panic!!! The devlopers of this application have not accounted for this to happen. We have trained monkey's working on fixing it right now.            ",title:"404",Activities: [.none])
    
    
    func chooseBooth(at: String) -> Booth
    {
        print(at)
        setbooth(booth: TitleDesc[at])
        return  TitleDesc[at] ?? errorBooth
    }
    
    func setbooth(booth: Booth?){
        currentBooth = booth ?? errorBooth
    }
 
}
