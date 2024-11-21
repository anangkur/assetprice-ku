//
//  ViewController.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CurrencyManagerDelegate, CoinPriceManagerDelegate {

    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var coinPriceLabel: UILabel!
    @IBOutlet weak var coinIconImageView: UIImageView!
    
    private let currencyManager = CurrencyManager()
    private let coinPriceManager = CoinPriceManager()
    
    private var currencies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinPriceManager.delegate = self
        currencyManager.delegate = self
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
        
        currencyManager.fetchCurrencies()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = currencies[row]
        currencyLabel.text = currency
        coinPriceManager.fetchCoinPrice(coin: "BTC", currency: currency)
    }
    
    func onSuccessFetchCurrency(currencies: [String]) {
        self.currencies = currencies
        DispatchQueue.main.async {
            self.currencyPickerView.reloadAllComponents()
        }
    }
    
    func onFailedFetchCurrency(error: any Error) {
        print(error)
    }
    
    func onSuccessFetchCoinPrice(coinPrice: String?) {
        DispatchQueue.main.async {
            self.coinPriceLabel.text = coinPrice
        }
    }
    
    func onFailedFetchCoinPrice(error: any Error) {
        print(error)
    }
}

