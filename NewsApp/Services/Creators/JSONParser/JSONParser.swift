//
//  JSONParser.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

final class JSONParser: JSONParserProtocol {
    func parseJSON(with data: Data, completionHandler: @escaping ((NewsModelAPI) -> Void)) {
        let decoder = JSONDecoder()
        guard let newsAPI = try? decoder.decode(NewsModelAPI.self, from: data) else {
            print(Errors.decodeData.rawValue)
            return
        }
        completionHandler(newsAPI)
    }
}
