//
//  Constants.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class Constants {
    static let shared = Constants()
    private let apiKey = "pub_251462d445c7464a6d50c855f1cd7f1ab572d"
    
    var urlString: String {
        let urlStr = "https://newsdata.io/api/1/news?apikey=\(self.apiKey)&q=pizza"
        return urlStr
    }
    
    var urlStringNextPage: String {
        let urlStr = "https://newsdata.io/api/1/news?apikey=\(self.apiKey)&q=pizza&page="
        return urlStr
    }
    
    private init() {}
}
