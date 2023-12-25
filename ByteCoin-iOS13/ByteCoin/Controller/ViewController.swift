//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    


    @IBOutlet weak var CurrencyLabel: UILabel!
    
    @IBOutlet weak var CurrencyPicker: UIPickerView!

    @IBOutlet weak var BitcoinLabel: UILabel!
    var coinManager=CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CurrencyPicker.dataSource=self
        CurrencyPicker.delegate=self
        coinManager.delegate=self
        
    }
    
    func numberOfComponents(in pickerview: UIPickerView)->Int{
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int{
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency=coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
}

//MARK: - CoinManagerDelegate


extension ViewController:coinManagerDelegate{
    func didUpdateData(_ coinManager: CoinManager) {
        
        
    }
    
    func didFailWithError(error: Error) {
        
    }
}

