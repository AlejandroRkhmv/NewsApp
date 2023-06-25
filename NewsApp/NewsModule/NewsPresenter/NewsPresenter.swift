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
    var newsInteractor: NewsInteractorProtocol
    var newsRouter: RouterProtocol
    var context: NSManagedObjectContext?
    var news = [News]()
    var totalResults = 0
    var nextPage = ""
    
    required init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol, newsRouter: RouterProtocol, context: NSManagedObjectContext?) {
        self.newsViewController = newsViewController
        self.newsInteractor = newsInteractor
        self.newsRouter = newsRouter
        self.context = context
    }
    
    func getNewsForTable() {
        newsInteractor.needNewsForTable(newxPage: self.nextPage, typeOfNews: .firstNews, completionHandler: { [weak self] (news, infoNews) in
            guard let self = self else { return }
            self.news = news
            self.totalResults = infoNews.totalResults
            self.nextPage = infoNews.nextPage
            DispatchQueue.main.async {
                self.newsViewController?.reloadData()
            }
        })
    }
    
    func loadNextNews() {
        if totalResults > news.count {
            newsInteractor.needNewsForTable(newxPage: self.nextPage, typeOfNews: .additionalNews, completionHandler: { [weak self] (news, infoNews) in
                guard let self = self else { return }
                self.news += news
                self.totalResults = infoNews.totalResults
                self.nextPage = infoNews.nextPage
                DispatchQueue.main.async {
                    self.newsViewController?.reloadData()
                }
            })
        }
    }
    
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        newsInteractor.loadImageData(from: urlString, completionHandler: completionHandler)
    }
    
    func goToDetailNewsViewController(with news: News) {
        newsRouter.goToDetailViewController(news: news, context: self.context)
    }
}
