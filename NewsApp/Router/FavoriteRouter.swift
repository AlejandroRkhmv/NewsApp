//
//  FavoriteRouter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit
import CoreData

final class FavoriteRouter: Router {
    
    override func openViewController() {
        super.openViewController()
        guard let navigationController = navigationController,
              let newsViewController = builder?.createFavoriteNewsViewController(router: self) else { return }
        navigationController.viewControllers.append(newsViewController)
    }
}
