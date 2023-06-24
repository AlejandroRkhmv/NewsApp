//
//  FavoriteNewsInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

final class FavoriteNewsInteractor: FavoriteNewsInteractorProtocol {
    var context: NSManagedObjectContext?
    
    func getFavoriteNewsFromCoreData(completionHandler: @escaping (([News]) -> Void)) {
        guard let context = self.context else { return }
        let fetchRequest: NSFetchRequest<FavoriteNew> = FavoriteNew.fetchRequest()
        guard let news = try? context.fetch(fetchRequest) else {
            print(Errors.getNews)
            return }
        var favoriteNews = [News]()
        for new in news {
            guard let favoriteNew = News(news: new) else { return }
            favoriteNews.append(favoriteNew)
        }
        completionHandler(favoriteNews)
    }
}
