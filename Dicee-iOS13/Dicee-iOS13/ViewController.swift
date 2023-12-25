//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DiceAlpha1: UIImageView!
    
    @IBOutlet weak var DiceImageView1: UIImageView!
    
    @IBOutlet weak var DiceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   print("Text \(2+3) Text")
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        var DiceArray=[UIImage(imageLiteralResourceName: "DiceOne"), UIImage(imageLiteralResourceName: "DiceTwo"), UIImage(imageLiteralResourceName: "DiceThree"), UIImage(imageLiteralResourceName: "DiceFour"), UIImage(imageLiteralResourceName: "DiceFive"), UIImage(imageLiteralResourceName: "DiceSix")]
        DiceImageView1.image =  DiceArray.randomElement()
        DiceImageView2.image =  DiceArray[Int.random(in: 0...5)]
        
    }
    
}

