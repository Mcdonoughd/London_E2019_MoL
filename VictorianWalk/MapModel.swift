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
        "1":Booth(id:1, desc:"Victorian children saved their farthings to buy ”penny toys” from street sellers and dazzling toy arcades such as Lowther’s on the Strand. Lowther’s was an ”Aladdin fairy palace” of expensive train sets, dolls, and lead soldiers.",
            title:"Toy Shop",
            Activities: [.none]),
        
        "2":Booth(id:2, desc:"Tobacconists sold blends of loose tobacco, snuff, cigarettes, and smoking accessories. During Victorian times, habits were changing. Rolled cigarettes were available, and briar-root pipes replaced clay ones.",
            title:"Tobacconist",
            Activities: [.none]),
        
        "3":Booth(id:3, desc:"Victorian men would go to the barber’s for haircuts, shaves, shampooing, and ”singeing,” a process involving burning hairs to seal them off and strengthen them. Barbers often stored customers’ personal shaving mugs at the back of their shop.",
            title:"Barber Shop",
            Activities: [.Act,.Quiz]),
        
        "4":Booth(id:4, desc:"Working men would relax in the pub, meet with friends, play darts, or attend political meetings. Children sat outside, awaiting their parents, or were sent in to buy beer for drinking at home.",
            title:"The Pub",
            Activities: [.game]),
        
        "5":Booth(id:5, desc:"James Powell & Sons’ showroom was attached to their glasshouse off Fleet Street in Whitefriars. Their table and decorative glass were famed for their purity, subtle colours, and delicate decoration. The ‘Eve’ mosaic is a copy of one Powell’s made for St. Paul’s Cathedral.",
            title:"Glass Showroom",
            Activities: [.Search,.Imagine]),

        "6":Booth(id:6, desc:"Introduced by Italian immigrants, barrel organs could be programmed to play up to 12 popular tunes of the day. By 1900 there were nearly 500 in London’s noisy streets, competing with bagpipe players, singers, clowns, performing monkeys, and knife swallowers.",
            title:"Barrel Organ",
            Activities: [.none]),
        
        "7":Booth(id:7, desc:"Tea from China, India, and Ceylon (now called Sri Lanka) arriving in London was taken from the docks to the city’s many warehouses. After being graded and weighed, tea was blended and coffee was roasted and ground for distribution to grocers, tea rooms and hotels. ",title:"Tea & Coffee Warehouse",
            Activities: [.Imagine,.Quiz]),
        
        "8":Booth(id:8, desc:"Mr. Elkington on Lamb’s Conduit Street made visiting cards, business cards, invitations, and bookplates. Engravers usually worked alone in small workshops that smelt strongly of the inks, acids, and polishes they used.",
            title:"Engraver",
            Activities: [.Imagine,.Quiz]),
        
        "9":Booth(id:9, desc:"London’s watchmakers produced expensive watches for sale around the world. Their intricate work required strong light, so they often placed their workbenches near a window. Specialist skills included hinge-making, dial-painting, and case-making. ",
            title:"Watchmaker",
            Activities: [.none]),
        
        "10":Booth(id:10, desc:"Introduced for the millions of visitors to the Great Exhibition in 1851, public toilets were available in most towns and railway stations by the 1890s. You had to spend a penny to use one.",
            title:"Public Urinal",
            Activities: [.none]),

        "11":Booth(id:11, desc:"The cries of bakers and dairymen were a familiar sound on London’s streets. They pushed handcarts, sold bread and milk, and delivered their wares to private homes.",
            title:"Baker's Cart",
            Activities: [.none]),
        
        "12":Booth(id:12, desc:"Grocers like Fred Bugg in Bayswater sold the essentials of daily life. Tea, flour, sugar, and rice were drawn from larger containers, then weighed and wrapped for customers. Grocers often lived above their shops.",
            title:"Grocer",
            Activities: [.Imagine]),
        
        "13":Booth(id:13, desc:"For those too poor for a doctor, the pharmacist prepared pills and powder, or sold pre-packaged remedies. Poisonous liquids were kept in dark green or blue glass bottles with fluted sides to distinguish them from harmless fluids.",
            title:"Pharmacy",
            Activities: [.none]),
        
        "14":Booth(id:14, desc:"Respectable women in Victorian London always covered their heads outdoors. At the milliner’s they bought hats, bonnets, and caps, as well as various decorations. Milliners would clean and redesign hats to suit the latest trends of Paris.",
            title:"Milliner",
            Activities: [.none]),
        
        "15":Booth(id:15,desc:"Tailors catered to “white-collar” office workers. Clients first selected a length of material. The tailor measured them, prepared an paper pattern, and cut the cloth. He gave the pieces to an ‘outworker’ or assistant to stitch together on a sewing machine.",
            title:"Tailor",
            Activities: [.none]),
        "16":Booth(id:16,desc:"Many stationers manufactured popular “fancy stationery” - handmade Christmas and greeting cards, as well as Valentine's cards. Their shops were like newsagents today. Daily papers were widely read in London, especially the Daily Telegraph and the Daily Mail.",
            title:"Fancy Stationer",
            Activities: [.none]),
        
        "17":Booth(id:17,desc:"Pawnbrokers, referred to as “uncle,” were the poor person’s bank. Clothing and jewellery were handed over in exchange for a loan. If the loan was not repaid within a year, “uncle” could sell the goods. By 1900 there were 700 pawnbrokers in London.",
            title:"Pawnbroker",
            Activities: [.Search,.Quiz,.Imagine]),
        
        "18":Booth(id:18,desc:"London’s financial services employed thousands of clerks who did bookkeeping, correspondence, and cashier work behind grilles or screens. In the 1890s the Bank of England for the first time hired women who had passed an exam to count and register banknotes.",
            title:"Bank Clerks' Office",
            Activities: [.none]),
        
        "19":Booth(id:19,desc:"Bank accounts were primarily for businesses and the rich. The poor were paid weekly in cash that barely lasted seven days. Small savings for Christmas or weddings could be placed in a Post Office Savings or National Penny bank. They accepted deposits from a penny upwards.",
            title:"Bank Manager's Office",
            Activities: [.Imagine,.Quiz])
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
