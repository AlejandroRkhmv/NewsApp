//
//  NetworkService.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func newsRequest(with urlString: String, completion: @escaping (Data) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let sessionService = SessionService()
    
    func newsRequest(with urlString: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        sessionService.requestSession(with: url, completion: completion)
    }
    
   
}


