//
//  Constants.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class Constants {
    static let shared = Constants()
    private let apiKey = "pub_2489848c1bd14d0d2fdda41dd8482c6b6c036"
    
    var urlString: String {
        let urlStr = "https://newsdata.io/api/1/news?apikey=\(self.apiKey)&q=dogs"
        return urlStr
    }
    
    var urlStringNextPage: String {
        let urlStr = "https://newsdata.io/api/1/news?apikey=\(self.apiKey)&q=dogs&page="
        return urlStr
    }
    
    private init() {}
}
