//
//  ViewController.swift
//  VictorianWalk
//
//  Created by Daniel McDonough on 19/05/2019.
//  Copyright © 2019 Daniel McDonough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let BG_Image = UIImageView(image: UIImage(named: "London_Street"), highlightedImage: nil)
        BG_Image.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        BG_Image.alpha = 0.8
        self.navigationController?.view.addSubview(BG_Image)
        
        
    }


}

