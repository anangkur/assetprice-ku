//
//  CurrencyManagerDelegate.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

protocol CurrencyManagerDelegate {
    func onSuccessFetchCurrency(currencies: [String])
    func onFailedFetchCurrency(error: Error)
}
