//
//  TabBarCreator.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

final class TabBarCreator {
    static func createAndConfigureTabBarController(with navigationControllers: [UINavigationController]) -> UITabBarController {
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers(navigationControllers, animated: true)
        tabBarViewController.tabBar.unselectedItemTintColor = .black
        tabBarViewController.tabBar.tintColor = .red
        tabBarViewController.tabBar.backgroundColor = .white
        return tabBarViewController
    }
}
