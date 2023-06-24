//
//  FavoriteNewsInteractorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol FavoriteNewsInteractorProtocol {
    var context: NSManagedObjectContext? { get set }
    func getFavoriteNewsFromCoreData(completionHandler: @escaping (([News]) -> Void))
}
