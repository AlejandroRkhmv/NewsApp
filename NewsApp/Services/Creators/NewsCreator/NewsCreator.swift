//
//  NewsCreator.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class NewsCreator: NewsCreatorProtocol {
    func createNewsForTable(from newsAPI: NewsModelAPI) -> [News] {
        var newsForTable = [News]()
        for newFromAPI in newsAPI.results {
            let new = News(news: newFromAPI)
            newsForTable.append(new)
        }
        return newsForTable
    }
    
    func createFavoriteNewsForCoreData(favoriteNews: FavoriteNew, news: News) {
        favoriteNews.title = news.title
        favoriteNews.descript = news.description
        favoriteNews.content = news.content
        favoriteNews.imageData = news.imageData
        favoriteNews.link = news.link
        favoriteNews.creator = news.creator.reduce("") { $0 + " " + $1 }
        favoriteNews.date = news.date
    }
}
