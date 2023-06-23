//
//  Router.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import UIKit

protocol NewsRouterProtocol {
    var navigationController: UINavigationController? { get set }
    init(navigationController: UINavigationController?)
    func openNewsViewController()
}

class NewsRouter: NewsRouterProtocol {
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func openNewsViewController() {
        let builder = Builder()
        guard let navigationController = navigationController else { return }
        let newsViewController = builder.createNewsViewController(router: self)
        navigationController.viewControllers.append(newsViewController)
    }
    
    func goToDetailViewController() {
        
    }
}
