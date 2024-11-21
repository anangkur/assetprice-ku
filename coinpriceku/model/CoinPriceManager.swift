//
//  CoinPriceManager.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import Foundation

class CoinPriceManager: DataManagerDelegate, NetworkManagerDelegate {
    
    var delegate: CoinPriceManagerDelegate?
    
    private var dataManager = DataManager()
    private var networkmanager = NetworkManager()
    
    init() {
        dataManager.delegate = self
        networkmanager.delegate = self
    }
    
    func fetchCoinPrice(coin: String, currency: String) {
        networkmanager.createNetworkingSession(url: "https://rest.coinapi.io/v1/exchangerate/\(coin)/\(currency)?apikey=dd32591d-8542-4c89-9dc9-c85f05a7117c")
    }
    
    func onFetchDataSuccess(data: Data) {
        if let coinPriceData = dataManager.parseJsonToCoinPriceData(data: data) {
            delegate?.onSuccessFetchCoinPrice(coinPrice: coinPriceData.rateFormatted)
        }
    }
    
    func onFetchDataFailed(error: any Error) {
        delegate?.onFailedFetchCoinPrice(error: error)
    }
    
    func onParseDataFailed(error: any Error) {
        delegate?.onFailedFetchCoinPrice(error: error)
    }
}
