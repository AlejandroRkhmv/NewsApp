//
//  Router.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit
import CoreData

class Router: RouterProtocol {
    var builder: Builder
    var navigationController: UINavigationController?
    
    required init(builder: Builder, navigationController: UINavigationController?) {
        self.builder = builder
        self.navigationController = navigationController
    }
    
    func openViewController() {}
    
    func goToDetailViewController(news: News, context: NSManagedObjectContext?) {
        guard let navigationController = navigationController else { return }
        let detailNewsViewController = builder.createDetailNewsViewController(router: self, context: context, news: news)
        navigationController.pushViewController(detailNewsViewController, animated: false)
    }
}
