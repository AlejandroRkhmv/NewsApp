//
//  Router.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import UIKit
import CoreData

protocol NewsRouterProtocol {
    var navigationController: UINavigationController? { get set }
    init(navigationController: UINavigationController?)
    func openViewController()
    func goToDetailViewController(new: New?, context: NSManagedObjectContext)
}

class NewsRouter: NewsRouterProtocol {
    let builder = Builder()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func openViewController() {
        guard let navigationController = navigationController else { return }
        let newsViewController = builder.createNewsViewController(router: self)
        navigationController.viewControllers.append(newsViewController)
    }
    
    func goToDetailViewController(new: New?, context: NSManagedObjectContext) {
        guard let navigationController = navigationController else { return }
        let detailNewsViewController = builder.createDetailNewsViewController(router: self, context: context, new: new)
        navigationController.pushViewController(detailNewsViewController, animated: false)
    }
}

class FavoriteRouter: NewsRouterProtocol {
    let builder = Builder()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func openViewController() {
        guard let navigationController = navigationController else { return }
        let newsViewController = builder.createFavoriteNewsViewController(router: self)
        navigationController.viewControllers.append(newsViewController)
    }
    
    func goToDetailViewController(new: New?, context: NSManagedObjectContext) {
        guard let navigationController = navigationController else { return }
        let detailNewsViewController = builder.createDetailNewsViewController(router: self, context: context, new: new)
        navigationController.pushViewController(detailNewsViewController, animated: false)
    }
}
