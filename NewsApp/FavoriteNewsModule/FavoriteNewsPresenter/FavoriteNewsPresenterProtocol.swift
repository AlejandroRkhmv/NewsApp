//
//  FavoriteNewsPresenterProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol FavoriteNewsPresenterProtocol: AnyObject {
    var favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol? { get set }
    var favoriteNewsInteractor: FavoriteNewsInteractorProtocol { get set }
    var router: RouterProtocol { get set }
    var context: NSManagedObjectContext? { get set }
    var favoriteNews: [News]? { get set }
    
    init(favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?, favoriteNewsInteractor: FavoriteNewsInteractorProtocol, router: RouterProtocol, context: NSManagedObjectContext?)
    
    func needsFavoriteNews()
    func goToDetailNewsViewController(with new: News)
}
