//
//  Errors.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

enum Errors: String, Error {
    case errorGetData = "Error get data news from server"
    case nilData = "Data == nil"
    case decodeData = "Can not decode data"
    case entity = "Error create entity for saving favorite new"
    case save = "Error during saving"
    case saveAfterDeleting = "Error during saving after deleting"
    case getNews = "Cannot get news from CoreData"
}
