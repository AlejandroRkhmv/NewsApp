//
//  DetailInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

final class DetailInteractor: DetailInteractorProtocol {
    var networkService: NetworkServiceProtocol
    var newsCreator: NewsCreatorProtocol
    var context: NSManagedObjectContext?
    
    required init(networkService: NetworkServiceProtocol, newsCreator: NewsCreatorProtocol, context: NSManagedObjectContext?) {
        self.networkService = networkService
        self.newsCreator = newsCreator
        self.context = context
    }
    
    func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService.newsRequest(with: imageUrl, completion: completionHandler)
    }
    
    func saveFavoritesNew(news: News) {
        guard let context = self.context else { return }
        let favoriteNews = FavoriteNew(context: context)
        newsCreator.createFavoriteNewsForCoreData(favoriteNews: favoriteNews, news: news)
        do {
            try context.save()
        } catch {
            print(Errors.save)
        }
    }
    
    func deleteFavoritesNew(news: News) {
        guard let context = self.context else { return }
        let fetchRequest: NSFetchRequest<FavoriteNew> = FavoriteNew.fetchRequest()
        if let favoriteNewsFromCoreData = try? context.fetch(fetchRequest) {
            for newsFromCoreData in favoriteNewsFromCoreData {
                if newsFromCoreData.title == news.title {
                    context.delete(newsFromCoreData)
                }
            }
        } else {
            print(Errors.getNews.rawValue)
        }
        do {
            try context.save()
        } catch {
            print(Errors.saveAfterDeleting)
        }
    }
}
