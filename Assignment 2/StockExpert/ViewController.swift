//
//  ViewController.swift
//  StockExpert
//
//  Created by Jayven on 10/28/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var txtStockName: UITextField!
    @IBOutlet weak var lblCEOName: UILabel!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    let apiKey = "e5703b3681bbb1f485c2d7a4efa5c35b"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getStockValue(_ sender: Any) {
        if self.txtStockName.text == nil {return}
        guard let stockName = txtStockName.text else { return }
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        getStockValue(stockURL: url, stockName: stockName)
    }
    
    func getStockValue(stockURL: String!, stockName: String!) {
        SwiftSpinner.show("Get Stock value for \(stockName)")
        Alamofire.request(stockURL).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess{
                guard let jsonString = response.result.value else { return }
                guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 {return}
                guard let price = stockJSON[0]["price"].double else { return }
                guard let ceoName = stockJSON[0]["ceo"].rawString() else { return }
 
                self.lblCEOName.text = "\(ceoName)"
                self.lblStockPrice.text = "\(price)"
            }
        }
    }
    
}

