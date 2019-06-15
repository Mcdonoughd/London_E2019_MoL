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
    var currentBooth = Booth(id:0,desc:"",title:"")
    
    
    var TitleDesc:[String : Booth] = [

        "1":Booth(id:1, desc:"Victorian children saved their money to buy \"penny toys\" from street sellers and dazzling toy arcades such as Lowther’s on the Strand. \n\n Lowther’s was an \"Aladdin fairy palace\" of expensive train sets, dolls, and lead soldiers.", title:"Toy Shop",hasActivity: true),
        
        "2":Booth(id:2, desc:"Tobacconists sold blends of loose tobacco. During Victorian times, habits were changing. Rolled cigarettes were available, and wooden smoking pipes replaced clay ones.",
            title:"Tobacconist"),
        
        "3":Booth(id:3, desc:"Victorian men would go to the barber’s for haircuts, shaves, shampooing, and \"singeing,\" which meant burning hairs to seal them off and strengthen them. \n\n Barbers often stored customers’ personal shaving mugs at the back of their shop.",
                  title:"Barber Shop",hasActivity:true),
        
        "4":Booth(id:4, desc:"Working men would relax in the pub, meet with friends, play darts, or attend political meetings. \n\n Children often sat outside, waiting for their parents, or were sent in to buy beer for drinking at home.",
            title:"The Pub", hasActivity: true),
        
        "5":Booth(id:5, desc:"James Powell & Sons’ showroom was attached to their glasshouse off Fleet Street in Whitefriars. Their table and decorative glass were famous for their high quality, subtle colours, and delicate decoration. \n\n The \"Eve\" mosaic on the wall, is a copy of one Powell’s made for St. Paul’s Cathedral.",            title:"Glass Showroom",hasActivity: true),

        "6":Booth(id:6, desc:"Introduced by Italian immigrants, barrel organs could play up to 12 popular tunes. \n\n By 1900 there were nearly 500 in London’s noisy streets, competing with bagpipe players, singers, clowns, performing monkeys, and knife swallowers.",
            title:"Barrel Organ"),
        
        "7":Booth(id:7, desc:"Tea from China, India, and Ceylon (now called Sri Lanka) arriving in London was taken from the docks to the city’s many warehouses. \n\n After being weighed, tea was blended and coffee was roasted and ground to send to grocers, tea rooms, and hotels.",title:"Tea & Coffee Warehouse",hasActivity: true),
       
        "8":Booth(id:8, desc:"Mr. Elkington on Lamb’s Conduit Street made visiting cards, business cards, invitations, and bookplates. Engravers usually worked alone in small workshops that smelt strongly of the inks, acids, and polishes they used.",
            title:"Engraver",hasActivity: true),
        
        "9":Booth(id:9, desc:"London’s watchmakers produced expensive watches for sale around the world. Their intricate work required strong light, so they often placed their workbenches near a window. \n\n Specialist skills included hinge-making, dial-painting, and watch case-making.",
            title:"Watchmaker"),
        
        "10":Booth(id:10, desc:"Introduced for the millions of visitors to the Great Exhibition in 1851, public toilets were available in most towns and railway stations by the 1890s. \n\n You had to spend a penny to use one. This is where the euphemism for going to the loo, ‘I’m off to spend a penny’!, comes from!",
            title:"Public Urinal"),

        "11":Booth(id:11, desc:"The cries of bakers and dairymen were a familiar sound on London’s streets. They pushed handcarts, sold bread and milk, and delivered their goods to private homes.",
            title:"Baker's Cart"),
        
        "12":Booth(id:12, desc:"Grocers like Fred Bugg in Bayswater sold the essentials of daily life. Tea, flour, sugar, and rice were drawn from larger containers, then weighed and wrapped for customers. Grocers often lived above their shops.",
            title:"Grocer",hasActivity: true),
        
        "13":Booth(id:13, desc:"The pharmacist was where you could go to get medicines. Poisonous liquids were kept in dark green or blue glass bottles with fluted sides to distinguish them from harmless fluids.",
            title:"Pharmacy"),
        
        "14":Booth(id:14, desc:"Wealthy women in Victorian London always covered their heads outdoors. \n\n At the milliner’s they bought hats, bonnets, and caps, as well as various decorations. Milliners would redesign hats, when fashions changed in Paris.",
            title:"Milliner"),
        
        "15":Booth(id:15,desc:"Tailors catered to \"upper class\" office workers. Clients first selected a length of material. The tailor measured them, prepared a paper pattern, and cut the cloth. He gave the pieces to an \"outworker\" or assistant to stitch together on a sewing machine.",
            title:"Tailor"),
        "16":Booth(id:16,desc:"Many stationers manufactured popular \"fancy stationery\" - handmade Christmas and greeting cards, as well as Valentine's cards. \n\n Their shops were like newsagents today. Daily papers were widely read in London, especially the Daily Telegraph and the Daily Mail.",
            title:"Fancy Stationer"),
        
        "17":Booth(id:17,desc:"Pawnbrokers, referred to as \"uncle,\" were the poor person’s bank. Clothing and jewellery were handed over in exchange for a loan. \n\n If the loan was not repaid within a year, \"uncle\" could sell the goods. By 1900 there were 700 pawnbrokers in London.", title:"Pawnbroker",hasActivity: true),
        
        "18":Booth(id:18,desc:"London’s financial services employed thousands of clerks who did bookkeeping, correspondence, and cashier work behind grilles or screens. \n\n In the 1890s the Bank of England for the first time hired women who had passed an exam to count and register banknotes.",
            title:"Bank Clerks' Office"),
        
        "19":Booth(id:19,desc:"Bank accounts were primarily for businesses and the rich. The poor were paid weekly in cash that barely lasted seven days. \n\n Small savings for Christmas or weddings could be placed in a Post Office Savings or National Penny bank. They accepted deposits from a penny upwards.",
            title:"Bank Manager's Office",hasActivity: true)
    ]
    
  let errorBooth = Booth(id:0, desc:"Do not panic!!! The developers of this application have not accounted for this to happen. We have trained monkeys working on fixing it right now.",title:"404")
    
    
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
