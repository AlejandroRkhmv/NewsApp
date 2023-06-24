//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation
import CoreData

final class NewsPresenter: NewsPresenterProtocol {
    weak var newsViewController: NewsViewControllerProtocol?
    var newsInteractor: NewsInteractorProtocol?
    var newsRouter: RouterProtocol?
    var context: NSManagedObjectContext!
    var news = [News]()
    
    required init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?, newsRouter: RouterProtocol?, context: NSManagedObjectContext!) {
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
    
    func goToDetailNewsViewController(with new: News?) {
        newsRouter?.goToDetailViewController(new: new, context: self.context)
    }
}
