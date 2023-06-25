//
//  DetailNewsViewControllerProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol DetailNewsViewControllerProtocol: AnyObject {
    func reloadView()
    func setNeedsData(from new: News)
}
