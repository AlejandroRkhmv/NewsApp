//
//  NavigationControllerCreator.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

final class NavigationControllerCreator {
    static func createNavigationControllers() -> [UINavigationController] {
        let builder = Builder()
        let newsNavigationController = UINavigationController()
        let newsRouter = NewsRouter(builder: builder, navigationController: newsNavigationController)
        newsRouter.openViewController()
        
        let favoriteNewsNavigationController = UINavigationController()
        let favoriterouter = FavoriteRouter(builder: builder, navigationController: favoriteNewsNavigationController)
        favoriterouter.openViewController()
        
        let navigationControllers = [newsNavigationController, favoriteNewsNavigationController]
        return navigationControllers
    }
}

