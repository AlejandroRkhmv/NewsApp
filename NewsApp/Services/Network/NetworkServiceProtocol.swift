//
//  NetworkServiceProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func newsRequest(with urlString: String, completion: @escaping (Data) -> Void)
}
