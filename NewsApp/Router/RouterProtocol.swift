//
//  RouterProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit
import CoreData

protocol RouterProtocol {
    var builder: Builder { get set }
    var navigationController: UINavigationController? { get set }
    
    init(builder: Builder, navigationController: UINavigationController?)
    
    func openViewController()
    func goToDetailViewController(news: News, context: NSManagedObjectContext?)
}
