//
//  ViewControllersUpdater.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

final class ViewControllersUpdater {
    static func updateViewControllers(for navigationControllers: [UINavigationController]) {
        for navC in navigationControllers {
            navC.viewControllers[0].view.reloadInputViews()
        }
    }
}
