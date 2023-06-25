//
//  FavoriteNewsInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

final class FavoriteNewsInteractor: FavoriteNewsInteractorProtocol {
    var newsCreator: NewsCreator
    var context: NSManagedObjectContext?
    
    required init(newsCreator: NewsCreator) {
        self.newsCreator = newsCreator
    }
    
    func getFavoriteNewsFromCoreData(completionHandler: @escaping (([News]) -> Void)) {
        guard let context = self.context else { return }
        let fetchRequest: NSFetchRequest<FavoriteNew> = FavoriteNew.fetchRequest()
        guard let newsFromCoreData = try? context.fetch(fetchRequest) else {
            print(Errors.getNews)
            return }
        let favoriteNews = newsCreator.createFavoriteNews(from: newsFromCoreData)
        completionHandler(favoriteNews)
    }
}
