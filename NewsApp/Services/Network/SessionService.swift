//
//  SessionService.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class SessionService {

    func requestSession(with url: URL, completion: @escaping (Data) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(Errors.errorGetData.rawValue)
                print(error.localizedDescription)
            }
            guard let data = data else {
                print(Errors.nilData.rawValue)
                return }
            completion(data)
        }
        task.resume()
    }
}
