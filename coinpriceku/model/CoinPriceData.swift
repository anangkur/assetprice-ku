//
//  CoinPriceData.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import Foundation

struct CoinPriceData : Decodable {
    let rate: Double
    var rateFormatted: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0;
        return formatter.string(from: NSNumber(value: rate))
    }
}
