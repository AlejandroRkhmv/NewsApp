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
        if news.imageData == nil && news.imageURL != "" {
            needDataForImageNews(with: self.news.imageURL) { [weak self] data in
                guard let self = self else { return }
                self.news.imageData = data
                DispatchQueue.main.async {
                    self.detailNewsViewController?.setNeedsData(from: self.news)
                    self.detailNewsViewController?.reloadView()
                }
            }
            DispatchQueue.main.async {
                self.detailNewsViewController?.setNeedsData(from: self.news)
            }
        } else {
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
