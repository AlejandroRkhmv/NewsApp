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
}
