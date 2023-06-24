//
//  DetailNewsPresenterProtocol.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

protocol DetailNewsPresenterProtocol: AnyObject {
    var detailNewsViewController: DetailNewsViewControllerProtocol? { get set }
    var detailInteractor: DetailInteractorProtocol? { get set }
    var router: RouterProtocol? { get set }
    var new: News? { get set }
    
    init(detailNewsViewController: DetailNewsViewControllerProtocol?, detailInteractor: DetailInteractorProtocol?, router: RouterProtocol?, new: News?)
    
    func setNeedData()
    func saveFavoritesNew()
    func deleteFavoritesNew()
}
