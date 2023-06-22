//
//  Builder.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

protocol BuilderProtocol {
    func createNewsViewController() -> UIViewController
}

class Builder: BuilderProtocol {
    
    func createNewsViewController() -> UIViewController {
        let networkService = NetworkService()
        let jsonParser = JSONParser()
        let newsCreator = NewsCreator()
        let newsViewController = NewsViewController()
        let newsInteractor = NewsInteractor(networkService: networkService, jsonParser: jsonParser, newsCreator: newsCreator)
        let newsPresenter = NewsPresenter(newsViewController: newsViewController, newsInteractor: newsInteractor)
        newsViewController.newsPresenter = newsPresenter
        return newsViewController
    }
}
