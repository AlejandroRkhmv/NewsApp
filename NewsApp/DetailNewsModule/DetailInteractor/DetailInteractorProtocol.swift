//
//  DetailInteractorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol DetailInteractorProtocol {
    var networkService: NetworkServiceProtocol { get set }
    var newsCreator: NewsCreatorProtocol { get set }
    var context: NSManagedObjectContext? { get set }
    
    init(networkService: NetworkServiceProtocol, newsCreator: NewsCreatorProtocol, context: NSManagedObjectContext?)
    
    func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void))
    func saveFavoritesNew(news: News)
    func deleteFavoritesNew(news: News)
}
