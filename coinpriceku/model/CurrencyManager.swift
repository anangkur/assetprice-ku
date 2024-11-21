//
//  CurrencyManager.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import Foundation

class CurrencyManager : NetworkManagerDelegate, DataManagerDelegate {
    
    var delegate: CurrencyManagerDelegate?
    
    private var networkManager = NetworkManager()
    private var dataManager = DataManager()
    
    init() {
        networkManager.delegate = self
        dataManager.delegate = self
    }
    
    func fetchCurrencies() {
        networkManager.createNetworkingSession(url: "https://rest.coinapi.io/v1/assets?apikey=dd32591d-8542-4c89-9dc9-c85f05a7117c")
    }
    
    func onFetchDataSuccess(data: Data) {
        if let currencyData = dataManager.parseJsonToCurrencyData(data: data) {
            delegate?.onSuccessFetchCurrency(currencies: currencyData.map { $0.asset_id })
        }
    }
    
    func onFetchDataFailed(error: any Error) {
        delegate?.onFailedFetchCurrency(error: error)
    }
    
    func onParseDataFailed(error: any Error) {
        delegate?.onFailedFetchCurrency(error: error)
    }
}
