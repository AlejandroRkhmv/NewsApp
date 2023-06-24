//
//  FavoriteNewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation
import CoreData

final class FavoriteNewsPresenter: FavoriteNewsPresenterProtocol {
    weak var favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?
    var favoriteNewsInteractor: FavoriteNewsInteractorProtocol?
    var router: RouterProtocol?
    var context: NSManagedObjectContext!
    var favoriteNews: [News]?
    
    required init(favoriteNewsViewVontroller: FavoriteNewsViewControllerProtocol?, favoriteNewsInteractor: FavoriteNewsInteractorProtocol?, router: RouterProtocol?, context: NSManagedObjectContext!) {
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
    
    func goToDetailNewsViewController(with new: News) {
        router?.goToDetailViewController(new: new, context: self.context)
    }
}
