//
//  NetworkService.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    let sessionService = SessionService()
    
    func newsRequest(with urlString: String, completion: @escaping (Data) -> Void) {
        if let data = Cache.cache.object(forKey: urlString as AnyObject)?.data {
            completion(data)
        } else {
            guard let url = URL(string: urlString) else { return }
            sessionService.requestSession(with: url) { data in
                let dataForCache = DataCoverega(data: data)
                Cache.cache.setObject(dataForCache, forKey: urlString as AnyObject)
                completion(data)
            }
        }
    }
}
