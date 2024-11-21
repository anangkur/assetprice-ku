//
//  CoinPriceManagerDelegate.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

protocol CoinPriceManagerDelegate {
    func onSuccessFetchCoinPrice(coinPrice: String?)
    func onFailedFetchCoinPrice(error: Error)
}
