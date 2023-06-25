//
//  FavoriteNewsInteractorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol FavoriteNewsInteractorProtocol {
    var newsCreator: NewsCreator { get set }
    var context: NSManagedObjectContext? { get set }
    
    init(newsCreator: NewsCreator)
    
    func getFavoriteNewsFromCoreData(completionHandler: @escaping (([News]) -> Void))
}
