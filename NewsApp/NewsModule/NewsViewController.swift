//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

protocol NewsViewControllerProtocol: AnyObject {
    func reloadData()
}

class NewsViewController: UIViewController {
    
    var newsPresenter: NewsPresenterProtocol?
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let news = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        self.tabBarItem = news
        addTableView()
        newsPresenter?.getNewsForTable()
    }
}

extension NewsViewController {
    func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension NewsViewController: NewsViewControllerProtocol {
    func reloadData() {
        self.tableView.reloadData()
    }
}
