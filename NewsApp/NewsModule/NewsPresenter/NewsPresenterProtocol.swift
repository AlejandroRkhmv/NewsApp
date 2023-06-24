//
//  NewsPresenterProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation
import CoreData

protocol NewsPresenterProtocol: AnyObject {
    var newsViewController: NewsViewControllerProtocol? { get set }
    var newsInteractor: NewsInteractorProtocol? { get set }
    var newsRouter: RouterProtocol? { get set }
    var context: NSManagedObjectContext! { get set }
    var news: [News] { get set }
    
    init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?, newsRouter: RouterProtocol?, context: NSManagedObjectContext!)
    
    func getNewsForTable()
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void))
    func goToDetailNewsViewController(with new: News?)
}
