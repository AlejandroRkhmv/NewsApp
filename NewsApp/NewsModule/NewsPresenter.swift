//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

protocol NewsPresenterProtocol: AnyObject {
    var newsViewController: NewsViewControllerProtocol? { get set }
    var newsInteractor: NewsInteractorProtocol? { get set }
    var news: [New] { get set }
    init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?)
    func getNewsForTable()
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void))
}

class NewsPresenter: NewsPresenterProtocol {
    weak var newsViewController: NewsViewControllerProtocol?
    var newsInteractor: NewsInteractorProtocol?
    var news = [New]()
    
    required init(newsViewController: NewsViewControllerProtocol?, newsInteractor: NewsInteractorProtocol?) {
        self.newsViewController = newsViewController
        self.newsInteractor = newsInteractor
    }
    
    func getNewsForTable() {
        newsInteractor?.needNewsForTable(completionHandler: { [weak self] news in
            guard let self = self else { return }
            self.news = news
            print(self.news.count)
            DispatchQueue.main.async {
                self.newsViewController?.reloadData()
            }
        })
    }
    
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        newsInteractor?.loadImageData(from: urlString, completionHandler: completionHandler)
    }
}
