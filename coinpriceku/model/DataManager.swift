//
//  DataManager.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import Foundation

struct DataManager {
    
    var delegate: DataManagerDelegate?
    
    private let decoder = JSONDecoder()
    
    func parseJsonToCurrencyData(data: Data) -> [Currency]? {
        do {
            return try decoder.decode([Currency].self, from: data)
        } catch {
            delegate?.onParseDataFailed(error: error)
            return nil
        }
    }
    
    func parseJsonToCoinPriceData(data: Data) -> CoinPriceData? {
        do {
            return try decoder.decode(CoinPriceData.self, from: data)
        } catch {
            delegate?.onParseDataFailed(error: error)
            return nil
        }
    }
}
