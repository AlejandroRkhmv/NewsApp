//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

final class NewsViewController: UIViewController {
    var newsPresenter: NewsPresenterProtocol?
    let tableView = UITableView()
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "News"
        let news = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        self.tabBarItem = news
        navigationItem.title = "News"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Courier new", size: 20)!]
        
        tableView.register(CommonTableViewCell.self, forCellReuseIdentifier: String(describing: CommonTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        addTableView()
        makeActivityIndicator()
        newsPresenter?.getNewsForTable()
    }
}
