//
//  FavoriteNewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

protocol FavoriteNewsPresenterProtocol: AnyObject {
    var favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol? { get set }
    var favoriteNewsInteractor: FavoriteNewsInteractorProtocol? { get set }
    var router: NewsRouterProtocol? { get set }
    var context: NSManagedObjectContext! { get set }
    var favoriteNews: [New]? { get set }
    
    init(favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?, favoriteNewsInteractor: FavoriteNewsInteractorProtocol?, router: NewsRouterProtocol?, context: NSManagedObjectContext!)
    func needsFavoriteNews()
    func goToDetailNewsViewController(with new: New)
}

class FavoriteNewsPresenter: FavoriteNewsPresenterProtocol {
    weak var favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?
    var favoriteNewsInteractor: FavoriteNewsInteractorProtocol?
    var router: NewsRouterProtocol?
    var context: NSManagedObjectContext!
    var favoriteNews: [New]?
    
    required init(favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?, favoriteNewsInteractor: FavoriteNewsInteractorProtocol?, router: NewsRouterProtocol?, context: NSManagedObjectContext!) {
        self.favoriteNewsViewVontroller = favoriteNewsViewVontroller
        self.favoriteNewsInteractor = favoriteNewsInteractor
        self.router = router
        self.context = context
    }
    
    func needsFavoriteNews() {
        //self.favoriteNews?.removeAll()
        favoriteNewsInteractor?.context = self.context
        favoriteNewsInteractor?.getFavoriteNewsFromCoreData(completionHandler: { news in
            self.favoriteNews = news
            DispatchQueue.main.async {
                self.favoriteNewsViewVontroller?.reloadData()
            }
        })
    }
    
    func goToDetailNewsViewController(with new: New) {
        router?.goToDetailViewController(new: new, context: self.context)
    }
}
