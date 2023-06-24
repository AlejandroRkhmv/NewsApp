//
//  NewsInteractor.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

protocol NewsInteractorProtocol {
    var networkService: NetworkServiceProtocol? { get set }
    var jsonParser: JSONParserProtocol? { get set }
    var newsCreator: NewsCreatorProtocol? { get set }
    
    init(networkService: NetworkServiceProtocol?, jsonParser: JSONParserProtocol?, newsCreator: NewsCreatorProtocol?)
    
    func needNewsForTable(completionHandler: @escaping (([New]) -> Void))
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void))
}

class NewsInteractor: NewsInteractorProtocol {
    
    var networkService: NetworkServiceProtocol?
    var jsonParser: JSONParserProtocol?
    var newsCreator: NewsCreatorProtocol?
    
    required init(networkService: NetworkServiceProtocol?, jsonParser: JSONParserProtocol?, newsCreator: NewsCreatorProtocol?) {
        self.networkService = networkService
        self.jsonParser = jsonParser
        self.newsCreator = newsCreator
    }
    
    func needNewsForTable(completionHandler: @escaping (([New]) -> Void)) {
        let urlString = Constants.shared.urlString
        networkService?.newsRequest(with: urlString, completion: { [weak self] data in
            guard let self = self else { return }
            self.jsonParser?.parseJSON(with: data, completionHandler: { newsAPI in
                guard let news = self.newsCreator?.createNewsForTable(from: newsAPI) else { return }
                completionHandler(news)
            })
        })
    }
    
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService?.newsRequest(with: urlString, completion: completionHandler)
    }
}
