//
//  NewsInteractorProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol NewsInteractorProtocol {
    var networkService: NetworkServiceProtocol? { get set }
    var jsonParser: JSONParserProtocol? { get set }
    var newsCreator: NewsCreatorProtocol? { get set }
    
    init(networkService: NetworkServiceProtocol?, jsonParser: JSONParserProtocol?, newsCreator: NewsCreatorProtocol?)
    
    func needNewsForTable(completionHandler: @escaping (([News]) -> Void))
    func loadImageData(from urlString: String, completionHandler: @escaping ((Data) -> Void))
}
