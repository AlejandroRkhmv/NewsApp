//
//  DetailInteractorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol DetailInteractorProtocol {
    var networkService: NetworkServiceProtocol? { get set }
    var context: NSManagedObjectContext! { get set }
    
    init(networkService: NetworkServiceProtocol?, context: NSManagedObjectContext!)
    
    func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void))
    func saveFavoritesNew(new: News?)
    func deleteFavoritesNew(new: News?)
}
