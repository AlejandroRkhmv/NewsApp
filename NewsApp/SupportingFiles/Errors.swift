//
//  Errors.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

enum Errors: String, Error {
    case errorGetDataNewsFromServer
    case nilData = "Data == nil"
    case decodeData = "Can not decode data"
    
}
