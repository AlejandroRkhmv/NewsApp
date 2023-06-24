//
//  Cache.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

final class Cache {
    static var cache: NSCache<AnyObject, DataCoverega> = {
        let cache = NSCache<AnyObject, DataCoverega>()
        return cache
    }()
    private init() {}
}

final class DataCoverega {
    let data: Data
    init (data: Data) {
        self.data = data
    }
}
