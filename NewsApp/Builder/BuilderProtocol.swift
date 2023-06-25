//
//  BuilderProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit
import CoreData

protocol BuilderProtocol {
    func createNewsViewController(router: RouterProtocol) -> UIViewController
    func createFavoriteNewsViewController(router: RouterProtocol) -> UIViewController
    func createDetailNewsViewController(router: RouterProtocol, context: NSManagedObjectContext?, news: News) -> UIViewController
}
