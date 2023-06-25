//
//  NewsCreatorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol NewsCreatorProtocol {
    func createNewsForTable(from newsAPI: NewsModelAPI) -> [News]
    func createFavoriteNewsForCoreData(favoriteNews: FavoriteNew, news: News)
}
