//
//  InfoNews.swift
//  NewsApp
//
//  Created by Александр Рахимов on 25.06.2023.
//

import Foundation

final class InfoNews {
    let status: String
    let totalResults: Int
    let nextPage: String
    
    init(news: NewsModelAPI) {
        self.status = news.status
        self.totalResults = news.totalResults
        self.nextPage = news.nextPage
    }
}
