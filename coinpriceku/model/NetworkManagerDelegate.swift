//
//  NetworkManagerDelegate.swift
//  coinpriceku
//
//  Created by Anang Kurniawan on 21/11/24.
//

import Foundation

protocol NetworkManagerDelegate {
    func onFetchDataSuccess(data: Data)
    func onFetchDataFailed(error: Error)
}
