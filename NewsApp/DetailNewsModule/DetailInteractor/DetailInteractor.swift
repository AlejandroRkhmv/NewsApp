//
//  DetailInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

final class DetailInteractor: DetailInteractorProtocol {
    var networkService: NetworkServiceProtocol?
    var context: NSManagedObjectContext!
    
    required init(networkService: NetworkServiceProtocol?, context: NSManagedObjectContext!) {
        self.networkService = networkService
        self.context = context
    }
    
    func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService?.newsRequest(with: imageUrl, completion: completionHandler)
    }
    
    func saveFavoritesNew(new: News?) {
        guard let new = new,
        let context = self.context else { return }
        let favoriteNew = FavoriteNew(context: context)
        favoriteNew.title = new.title
        favoriteNew.descript = new.description
        favoriteNew.content = new.content
        favoriteNew.imageData = new.imageData
        favoriteNew.link = new.link
        favoriteNew.creator = new.creator.reduce("") { $0 + " " + $1 }
        favoriteNew.date = new.date
        do {
            try context.save()
        } catch {
            print(Errors.save)
        }
    }
    
    func deleteFavoritesNew(new: News?) {
        guard let context = self.context else { return }
        let fetchRequest: NSFetchRequest<FavoriteNew> = FavoriteNew.fetchRequest()
        if let news = try? context.fetch(fetchRequest) {
            for newFromCoreData in news {
                if newFromCoreData.title == new?.title {
                    context.delete(newFromCoreData)
                }
            }
        }
        do {
            try context.save()
        } catch {
            print(Errors.saveAfterDeleting)
        }
    }
}
