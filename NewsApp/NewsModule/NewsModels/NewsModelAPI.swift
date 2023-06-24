//
//  NewsModelAPI.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

struct NewsModelAPI: Codable {
    let status: String
    let totalResults: Int
    let results: [APINews]
    let nextPage: String
}

struct APINews: Codable {
    let title: String?
    let link: String?
    let creator: [String]?
    let description: String?
    let content: String?
    let pubDate: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case creator
        case description
        case content
        case pubDate
        case imageURL = "image_url"
    }
}

