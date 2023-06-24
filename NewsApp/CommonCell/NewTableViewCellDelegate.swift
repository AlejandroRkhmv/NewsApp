//
//  NewTableViewCellDelegate.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol NewTableViewCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping ((Data) -> Void))
}
