//
//  FavoriteNew+CoreDataProperties.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//
//

import Foundation
import CoreData


extension FavoriteNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteNew> {
        return NSFetchRequest<FavoriteNew>(entityName: "FavoriteNew")
    }

    @NSManaged public var content: String?
    @NSManaged public var creator: String?
    @NSManaged public var date: String?
    @NSManaged public var descript: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var link: String?
    @NSManaged public var title: String?

}

extension FavoriteNew : Identifiable {

}
