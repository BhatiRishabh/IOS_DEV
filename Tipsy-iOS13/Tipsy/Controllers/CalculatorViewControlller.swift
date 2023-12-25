//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewControlller: UIViewController {
    var tipPercentage:Float!
    var splitnumber:Float!
    var result:Float!
    @IBOutlet weak var billamountLabel: UITextField!
    
    
    @IBOutlet weak var zeroperLabel: UIButton!
    
    @IBOutlet weak var tenperLabel: UIButton!
    
    @IBOutlet weak var twentyperLabel: UIButton!
    
    
    @IBOutlet weak var splitController: UIStepper!
    
    @IBOutlet weak var splitDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        billamountLabel.endEditing(true)
        if sender.titleLabel==zeroperLabel.titleLabel{
            sender.isSelected=true
            tenperLabel.isSelected=false
            twentyperLabel.isSelected=false
            tipPercentage=0.0
            
        }else if sender.titleLabel==tenperLabel.titleLabel{
            sender.isSelected=true
            zeroperLabel.isSelected=false
            twentyperLabel.isSelected=false
            tipPercentage=10.0
        }else{
            sender.isSelected=true
            tenperLabel.isSelected=false
            zeroperLabel.isSelected=false
            tipPercentage=20.0
        }
            
    }
    
    @IBAction func chooseSplit(_ sender: UIStepper) {
        splitnumber=Float(sender.value)
        splitDisplayLabel.text=String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let billamount = Float(billamountLabel.text ?? "0.0")
        result=((billamount!)+billamount!*(tipPercentage!/100.0))/splitnumber
        print(result!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalbill=String(format: "%.2f", self.result!)
            destinationVC.setting="Split between \(Int(self.splitnumber!)) person, with \(Int(self.tipPercentage!))% tip"
            
        }
    }
    

}

