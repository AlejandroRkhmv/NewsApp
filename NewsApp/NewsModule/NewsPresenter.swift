//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation
import CoreData

protocol NewsPresenterProtocol: AnyObject {
    var newsViewController: NewsViewControllerProtocol? { get set }
    var newsInteractor: NewsInteractorProtocol? { get set }
    var newsRouter: NewsRouterProtocol? { get set }
    var context: NSManagedObjectContext! { get set }
    var news: [New] { get set }
    
    init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?, newsRouter: NewsRouterProtocol?, context: NSManagedObjectContext!)
    
    func getNewsForTable()
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void))
    func goToDetailNewsViewController(with new: New?)
}

class NewsPresenter: NewsPresenterProtocol {
    weak var newsViewController: NewsViewControllerProtocol?
    var newsInteractor: NewsInteractorProtocol?
    var newsRouter: NewsRouterProtocol?
    var context: NSManagedObjectContext!
    var news = [New]()
    
    required init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?, newsRouter: NewsRouterProtocol?, context: NSManagedObjectContext!) {
        self.newsViewController = newsViewController
        self.newsInteractor = newsInteractor
        self.newsRouter = newsRouter
        self.context = context
    }
    
    func getNewsForTable() {
        newsInteractor?.needNewsForTable(completionHandler: { [weak self] news in
            guard let self = self else { return }
            self.news = news
            DispatchQueue.main.async {
                self.newsViewController?.reloadData()
            }
        })
    }
    
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        newsInteractor?.loadImageData(from: urlString, completionHandler: completionHandler)
    }
    
    func goToDetailNewsViewController(with new: New?) {
        newsRouter?.goToDetailViewController(new: new, context: self.context)
    }
}
