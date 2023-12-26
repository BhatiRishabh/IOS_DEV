//
//  CoinManager.swift
//  ByteCoin
//

import Foundation
protocol coinManagerDelegate{
    func didUpdateData(rate:Double, currency:String)
    func didFailWithError(error: Error)
}
struct CoinManager {
    var delegate:coinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "460A9CB6-9747-400B-98A0-122A173F07BE"
    
    
    func getCoinPrice(for currency:String){
        let urlString="\(baseURL)\(currency)?apikey=\(apiKey)"
//        print(urlString)
        if let url=URL(string: urlString){
            let session=URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData=data{
                    _=String(data: safeData, encoding: String.Encoding.utf8) as String?
                    //print(stringdata!)
                    if let rate=parseJSON(safeData){
                        self.delegate?.didUpdateData(rate: rate, currency: currency)
                    }
                                        
                }
            }
            task.resume()
        }
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func parseJSON(_ coindata: Data)->Double?{
     let decoder=JSONDecoder()
        do{
            let decodeData=try decoder.decode(CoinData.self, from: coindata)
            let lastPrice=decodeData.rate
            return lastPrice
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
