//
//  Builder.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit
import CoreData

final class Builder: BuilderProtocol {
    let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext
    let networkService = NetworkService()
    
    func createNewsViewController(router: RouterProtocol) -> UIViewController {
        let jsonParser = JSONParser()
        let newsCreator = NewsCreator()
        let newsViewController = NewsViewController()
        guard let context = self.context else { return newsViewController }
        let newsInteractor = NewsInteractor(networkService: networkService, jsonParser: jsonParser, newsCreator: newsCreator)
        let newsPresenter = NewsPresenter(newsViewController: newsViewController, newsInteractor: newsInteractor, newsRouter: router, context: context)
        newsViewController.newsPresenter = newsPresenter
        return newsViewController
    }
    
    func createFavoriteNewsViewController(router: RouterProtocol) -> UIViewController {
        let favoriteNewsViewController = FavoriteNewsViewController()
        let favoriteNewsInteractor = FavoriteNewsInteractor()
        let favoriteNewsPresenter = FavoriteNewsPresenter(favoriteNewsViewVontroller: favoriteNewsViewController, favoriteNewsInteractor: favoriteNewsInteractor, router: router, context: self.context)
        favoriteNewsViewController.favoriteNewsPresenter = favoriteNewsPresenter
        return favoriteNewsViewController
    }
    
    func createDetailNewsViewController(router: RouterProtocol, context: NSManagedObjectContext, new: News?) -> UIViewController {
        let detailNewsViewController = DetailNewsViewController()
        let detailInteractor = DetailInteractor(networkService: networkService, context: context)
        let detailNewsPresenter = DetailNewsPresenter(detailNewsViewController: detailNewsViewController, detailInteractor: detailInteractor, router: router, new: new)
        detailNewsViewController.detailNewsPresenter = detailNewsPresenter
        return detailNewsViewController
    }
}
