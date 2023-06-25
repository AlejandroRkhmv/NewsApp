//
//  NewsRouter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import UIKit

final class NewsRouter: Router {
    override func openViewController() {
        super.openViewController()
        guard let navigationController = navigationController else { return }
        let newsViewController = builder.createNewsViewController(router: self)
        navigationController.viewControllers.append(newsViewController)
    }
}
