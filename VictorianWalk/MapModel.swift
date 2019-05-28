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
        "1":Booth(id:1, desc:"Victorian children saved their farthings to buy, ‘penny toys’ from street sellers and dazzling toy arcades such as Lowther’s on the Strand. With rows of small shops like this one, Lowther’s toyshop was an ‘Aladdin fairy palace’ of expensive train sets, dolls, and lead soldiers, ‘all the glories and wonders a child’s fancy can conceive’",
            title:"Toy Shop",
            Activities: [.none]),
        
        "2":Booth(id:2, desc:"Tobacconists sold blends of loose tobacco, snuff, cigarettes and smoking accessories. Habits were changing. Rolled cigarettes were available, and briar-root pipes replaced clay ones. Wooden figures told shoppers what was on sale: a Scottish Highlander advertised that snuff was sold; a Blackmoor - tobacco from the United States of America.",
            title:"Tobacconist",
            Activities: [.none]),
        
        "3":Booth(id:3, desc:"A barber’s services for men included haircuts, shaves, and shampooing. Hair was also, ‘signed.’ A lit wax taper was passed over the ends and the burnt tips rubbed off to seal and strengthen the hair. Barbers often stored customer’s personal shaving mugs at the back of their shop. They also sold tobacco and pipes’",
            title:"Barber Shop",
            Activities: [.Act, .Imagine]),
        
        "4":Booth(id:4, desc:"Working men in London relaxed in the ‘pub’. It was the heart of the local community. They met with friends, played darts and attended political meetings. Children sat outside, awaiting their parents, or were sent in to buy beer for drinking at home. Many pubs had a public bar and a saloon. Saloons were favored by couples as they were more comfortable.",
            title:"The Pub",
            Activities: [.none]),
        
        "5":Booth(id:5, desc:"James Powell & Son’s showroom was attached to their glasshouse off Fleet Street in Whitefriars. Their table and decorative glass were famed for their purity, subtle colours and delicate decoration. They also sold stained glass, mosaics and expensive Wedgwood hand-painted creamware. The ‘Eve’ mosaic is a copy of one Powell’s made for St. Paul’s Cathedral",
            title:"Glass Showroom",
            Activities: [.none]),

        "6":Booth(id:6, desc:"Introduced by Italian immigrants, barrel organs could be programmed to play up to 12 popular tunes of the day. By 1900 they were nearly 500 in London’s noisy streets, competing with bagpipe players, singers, clowns, performing monkeys and knife swallowers.",
            title:"Barrel Organ",
            Activities: [.none]),
        
        "7":Booth(id:7, desc:"Goods from around the world arrived at London’s ports. They were taken from the docks to the city’s many warehouses. Tea was imported from China, India, and Ceylon(now called Sri Lanka); cocoa and coffee from Africa and South America. After being graded and weighed, tea was blended, and coffee roasted and ground for distribution to grocers, tea rooms and hotels.",
            title:"Tea & Coffee Warehouse",
            Activities: [.Imagine]),
        
        "8":Booth(id:8, desc:"Mr Elkington on Lamb’s Conduit Street made visiting cards, business cards, invitations, and bookplates. He might spend half a day engraving one intricate design onto a copper plate for printing. Engravers usually worked alone in small workshops that smelt strongly of the inks, acids, and polishes they used. They received work from private customers and small printing firms",
            title:"Engraver",
            Activities: [.Imagine]),
        
        "9":Booth(id:9, desc:"London’s watchmakers produced expensive watches for sale in the West End and around the world. Most were based in Clerkenwell. Their intricate work required strong light, so they often placed their workbenches near a window, The trade was organized on an ‘outwork’ system. Watch parts moved between the homes and workshops of many workers before being assembled by ‘finishers’. Specialist skills included hinge-making, dial-painting, and case-making.",
            title:"Watchmaker",
            Activities: [.none]),
        
        "10":Booth(id:10, desc:"Introduced for the millions of visitors to the Great Exhibition in 1851, public toilets were available in most towns and railway stations by the 1890’s. You had to ‘spend a penny’ to use one. The public lavatories at High Holborn included this urinal, marble panels, and class cistern.",
            title:"Public Urinal",
            Activities: [.none]),

        "11":Booth(id:11, desc:"The cries of bakers and dairymen were a familiar sound on London’s streets. They pushed handcarts, sold bread and mild and delivered their wares to private homes.",
            title:"Baker's Cart",
            Activities: [.none]),
        
        "12":Booth(id:12, desc:"Grocers liked Fred Bugg in Bayswater sold the essentials of daily life. Tea, flour, sugar, and rice were drawn from larger containers, then weighed and wrapped for customers. Grocers also sold firewood and paraffin and for the first time, canned and processed foods - condensed milk, tinned fish. They often lived about the shops. Grocers worked weekdays and late into the evening on Saturdays, when workers came to shop after being paid their wages.",
            title:"Grocer",
            Activities: [.Imagine]),
        
        "13":Booth(id:13, desc:"For those too poor to pay the doctor, the pharmacist prepared pills and powder, or sold pre-packaged ‘patent’ remedies. The herbs and chemicals he mixed together were stored in tiny drawers behind the counter. Poisonous liquids were kept in dark green or blue glass bottles with fluted sides to distinguish them from harmless fluids.",
            title:"Pharmacy",
            Activities: [.none]),
        
        "14":Booth(id:14, desc:"Respectable women in Victorian London always covered their heads outdoors. At the milliner’s they bought hats, bonnets, and caps, as well as artificial flowers, feathers, ribbons and lace to decorate or ‘trim’ them. Fashions changed quickly reflecting the trends of Paris. Milliners would clean and redesign hats to suit the latest taste.",
            title:"Milliner",
            Activities: [.none]),
        
        "15":Booth(id:15,desc:"Tailors catered to ‘white-collar’ office worked. Clients first selected a length of material. The tailor measured them, prepared an paper pattern and cut the cloth. He gave the pieces to an ‘outworker’ or assistant to stitch together on a sewing machine. Poor Londoners had nothing ‘tailor-made’, but bought used clothes from shops and markets.",
            title:"Tailor",
            Activities: [.none]),
        "16":Booth(id:16,desc:"Many stationers manufactured popular ‘fancy stationery’ - handmade Christmas and greeting cards, as well as Valentine's cards. Their shops were like newsagents today. They sold newspapers, magazines, cigarettes, and stationery. Daily papers were widely read in London, especially the Daily Telegraph and Daily Mail.",
            title:"Fancy Stationer",
            Activities: [.none]),
        
        "17":Booth(id:17,desc:"Pawnbrokers, referred to as ‘uncle’, were the poor person’s bank. Clothing and jewellery were handed over in exchange for a loan. If the loan was not repaid within a year, ‘uncle’ could sell the goods. By 1900 there were 700 pawnbrokers in London. Forfeited articles for sale in the window include Sunday best clothing, wedding gifts and ornaments.",
            title:"Pawnbroker",
            Activities: [.Search,.Imagine]),
        
        "18":Booth(id:18,desc:"London’s financial services employed thousands of clerks. Their duties included bookkeeping, correspondence and cashier work behind grilles or screens. Banking jobs offered security, promotion and generally higher wages. In the 1890s the Bank of England for the first time hired women who had passed an exam to count and register banknotes. These offices were created from the central banking hall and offices of Barings Bank in Bishopsgate.",
            title:"Bank Clerks' Office",
            Activities: [.none]),
        
        "19":Booth(id:19,desc:"Bank managers were highly respected members of the community. Bank accounts were primarily for businesses and the rich. The poor were paid weekly in cash that barely lasted seven days. Small savings for Christmas or weddings could be placed in a Post Office Savings or National Penny bank. They accepted deposits from a penny upwards.",
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
