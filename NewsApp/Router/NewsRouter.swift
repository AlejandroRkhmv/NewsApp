//
//  NewsRouter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import UIKit
import CoreData

final class NewsRouter: Router {
    
    override func openViewController() {
        super.openViewController()
        guard let navigationController = navigationController,
              let newsViewController = builder?.createNewsViewController(router: self) else { return }
        navigationController.viewControllers.append(newsViewController)
    }
}
