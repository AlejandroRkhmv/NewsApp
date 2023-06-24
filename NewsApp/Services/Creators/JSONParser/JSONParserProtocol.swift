//
//  JSONParserProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol JSONParserProtocol {
    func parseJSON(with data: Data, completionHandler: @escaping ((NewsModelAPI) -> Void))
}
