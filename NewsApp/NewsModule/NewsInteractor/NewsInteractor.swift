//
//  NewsInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class NewsInteractor: NewsInteractorProtocol {
    var networkService: NetworkServiceProtocol
    var jsonParser: JSONParserProtocol
    var newsCreator: NewsCreatorProtocol
    
    required init(networkService: NetworkServiceProtocol, jsonParser: JSONParserProtocol, newsCreator: NewsCreatorProtocol) {
        self.networkService = networkService
        self.jsonParser = jsonParser
        self.newsCreator = newsCreator
    }
    
    func needNewsForTable(newxPage: String, typeOfNews: TypeOfNews, completionHandler: @escaping (([News], InfoNews) -> Void)) {
        var urlString = ""
        switch typeOfNews {
        case .firstNews:
            urlString = Constants.shared.urlString
        case .additionalNews:
            urlString = Constants.shared.urlStringNextPage
            urlString += newxPage
        }
        networkService.newsRequest(with: urlString, completion: { [weak self] data in
            guard let self = self else { return }
            self.jsonParser.parseJSON(with: data, completionHandler: { newsAPI in
                let news = self.newsCreator.createNewsForTable(from: newsAPI)
                let infoNews = self.newsCreator.createInfoNews(from: newsAPI)
                completionHandler(news, infoNews)
            })
        })
    }
    
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService.newsRequest(with: urlString, completion: completionHandler)
    }
}
