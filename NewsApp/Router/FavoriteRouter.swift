//
//  FavoriteRouter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

final class FavoriteRouter: Router {
    override func openViewController() {
        super.openViewController()
        guard let navigationController = navigationController else { return }
        let newsViewController = builder.createFavoriteNewsViewController(router: self)
        navigationController.viewControllers.append(newsViewController)
    }
}
