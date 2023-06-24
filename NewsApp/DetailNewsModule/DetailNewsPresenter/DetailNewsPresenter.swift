//
//  DetailNewsPresenter.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import Foundation

final class DetailNewsPresenter: DetailNewsPresenterProtocol {
    weak var detailNewsViewController: DetailNewsViewControllerProtocol?
    var detailInteractor: DetailInteractorProtocol?
    var router: RouterProtocol?
    var new: News?
    
    required init(detailNewsViewController: DetailNewsViewControllerProtocol?, detailInteractor: DetailInteractorProtocol?, router: RouterProtocol?, new: News?) {
        self.detailNewsViewController = detailNewsViewController
        self.detailInteractor = detailInteractor
        self.router = router
        self.new = new
    }
    
    func setNeedData() {
        guard let imageURL = self.new?.imageURL else { return }
        needDataForImageNews(with: imageURL) { data in
            self.new?.imageData = data
        }
        
        DispatchQueue.main.async {
            self.detailNewsViewController?.setNeedsData(from: self.new)
        }
    }
    
    private func needDataForImageNews(with imageUrl: String, completionHandler: @escaping ((Data) -> Void)) {
        detailInteractor?.needDataForImageNews(with: imageUrl, completionHandler: completionHandler)
    }
    
    func saveFavoritesNew() {
        detailInteractor?.saveFavoritesNew(new: self.new)
    }
    
    func deleteFavoritesNew() {
        detailInteractor?.deleteFavoritesNew(new: self.new)
    }
}
