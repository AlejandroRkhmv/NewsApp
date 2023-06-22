//
//  NewsCreator.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

protocol NewsCreatorProtocol {
    func createNewsForTable(from newsAPI: NewsModelAPI) -> [New]
}

class NewsCreator: NewsCreatorProtocol {
    func createNewsForTable(from newsAPI: NewsModelAPI) -> [New] {
        var newsForTable = [New]()
        print(newsAPI.results.count)
        for newFromAPI in newsAPI.results {
            let new = New(new: newFromAPI)
            newsForTable.append(new)
        }
        return newsForTable
    }
}
