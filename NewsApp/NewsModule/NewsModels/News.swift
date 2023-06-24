//
//  New.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class News {
    let title: String
    let description: String
    let content: String
    let date: String
    let imageURL: String
    var imageData: Data?
    let link: String
    let creator: [String]
    
    init(news: APINews) {
        self.creator = news.creator ?? [""]
        self.title = news.title ?? ""
        self.description = news.description ?? ""
        self.content = news.content ?? ""
        self.link = news.link ?? ""
        self.date = news.pubDate ?? ""
        self.imageURL = news.imageURL ?? ""
    }
    
    init?(news: FavoriteNew) {
        guard let creator = news.creator else { return nil }
        self.creator = [creator]
        self.imageURL = ""
        self.title = news.title ?? ""
        self.description = news.descript ?? ""
        self.content = news.content ?? ""
        self.link = news.link ?? ""
        self.date = news.date ?? ""
        self.imageData = news.imageData
    }
}
