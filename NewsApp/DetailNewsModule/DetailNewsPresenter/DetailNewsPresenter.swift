//
//  DetailNewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation

final class DetailNewsPresenter: DetailNewsPresenterProtocol {
    weak var detailNewsViewController: DetailNewsViewControllerProtocol?
    var detailInteractor: DetailInteractorProtocol
    var router: RouterProtocol
    var news: News
    
    required init(detailNewsViewController: DetailNewsViewControllerProtocol?, detailInteractor: DetailInteractorProtocol, router: RouterProtocol, news: News) {
        self.detailNewsViewController = detailNewsViewController
        self.detailInteractor = detailInteractor
        self.router = router
        self.news = news
    }
    
    func setNeedData() {
        needDataForImageNews(with: self.news.imageURL) { data in
            self.news.imageData = data
            DispatchQueue.main.async {
                self.detailNewsViewController?.setNeedsData(from: self.news)
            }
        }
    }
    
    private func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void)) {
        detailInteractor.needDataForImageNews(with: imageUrl, completionHandler: completionHandler)
    }
    
    func saveFavoritesNew() {
        detailInteractor.saveFavoritesNew(news: self.news)
    }
    
    func deleteFavoritesNew() {
        detailInteractor.deleteFavoritesNew(news: self.news)
    }
}
