//
//  Router.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit
import CoreData

class Router: RouterProtocol {
    var builder: Builder?
    var navigationController: UINavigationController?
    
    required init(builder: Builder?, navigationController: UINavigationController?) {
        self.builder = builder
        self.navigationController = navigationController
    }
    
    func openViewController() {}
    
    func goToDetailViewController(new: News?, context: NSManagedObjectContext) {
        guard let navigationController = navigationController,
                let detailNewsViewController = builder?.createDetailNewsViewController(router: self, context: context, new: new) else { return }
        navigationController.pushViewController(detailNewsViewController, animated: false)
    }
}
