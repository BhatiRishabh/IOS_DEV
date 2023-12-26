//
//  ViewController.swift
//  ByteCoin

import UIKit

class ViewController: UIViewController {
   
    


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
    
}

//MARK: - CoinManagerDelegate


extension ViewController:coinManagerDelegate{
    func didUpdateData(rate:Double, currency:String) {
        print(rate)
        DispatchQueue.main.sync {
            BitcoinLabel.text=String(format: "%.2f", rate)
            CurrencyLabel.text=currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
        
    }
}


//MARK: - UIPickerViewDelegate
extension ViewController:UIPickerViewDelegate{
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

//MARK: - UIPickerViewDataSource

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerview: UIPickerView)->Int{
        return 1
    }
    
}


