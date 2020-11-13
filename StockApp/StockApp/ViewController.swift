//
//  ViewController.swift
//  StockApp
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    let apiKey = "fa1a236066ec0d6f2b45cf9dc52d956c"
    
    let apiUrl = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    
    @IBOutlet weak var lblStockCeo: UILabel!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockValue(_ sender: UIButton) {
        guard let stockName = txtStockName.text else{ return }
        print(stockName)
        
        let url = "\(apiUrl)\(stockName)?apikey=\(apiKey)"
        print(url)
        
        SwiftSpinner.show("Getting Stock Info for \(stockName)")
        AF.request(url).responseJSON{(response)in
            SwiftSpinner.hide()
            if response.error == nil {
                guard let jsonString = response.data else{ return }
                guard let stockJSON:[JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 { return }
                guard let stockCeo = stockJSON[0]["ceo"].rawString() else{ return }
                guard let stockPrice = stockJSON[0]["price"].double else{ return }
                
                print(stockCeo)
                print(stockPrice)
                
                self.lblStockCeo.text = stockCeo
                self.lblStockPrice.text = "\(stockPrice)"
            }
            
        }
    }
}

