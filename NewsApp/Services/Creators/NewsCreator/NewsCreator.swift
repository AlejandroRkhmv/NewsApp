//
//  NewsCreator.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class NewsCreator: NewsCreatorProtocol {
    
    func createInfoNews(from newsAPI: NewsModelAPI) -> InfoNews {
        let infoNews = InfoNews(news: newsAPI)
        return infoNews
    }
    
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
        var creator = news.creator.reduce("") { $0 + " " + $1 }
        creator.removeFirst()
        favoriteNews.creator = creator
        favoriteNews.date = news.date
    }
    
    func createFavoriteNews(from newsFromCoreData: [FavoriteNew]) -> [News] {
        var favoriteNews = [News]()
        for news in newsFromCoreData.reversed() {
            guard let favoriteNew = News(news: news) else { return [] }
            favoriteNews.append(favoriteNew)
        }
        return favoriteNews
    }
}
