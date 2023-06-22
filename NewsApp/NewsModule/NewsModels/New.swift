//
//  New.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import Foundation

class New {
    let title: String
    let description: String
    let content: String
    let date: String
    let imageURL: String
    let link: String
    let creator: [String]
    
    init(new: APINew) {
        self.creator = new.creator ?? [""]
        self.title = new.title ?? ""
        self.description = new.description ?? ""
        self.content = new.content ?? ""
        self.link = new.link ?? ""
        self.date = new.pubDate ?? ""
        self.imageURL = new.imageURL ?? ""
    }
}
