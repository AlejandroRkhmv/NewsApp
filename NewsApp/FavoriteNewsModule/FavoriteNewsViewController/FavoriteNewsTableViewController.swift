//
//  FavoriteNewsTableViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

final class FavoriteNewsViewController: UIViewController {
    var favoriteNewsPresenter: FavoriteNewsPresenterProtocol?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "FavoriteNews"
        let favoriteNews = UITabBarItem(title: "Favorite News", image: UIImage(systemName: "star.square.on.square"), selectedImage: nil)
        self.tabBarItem = favoriteNews
        navigationItem.title = "Favorite News"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Courier new", size: 20)!]
        
        tableView.register(CommonTableViewCell.self, forCellReuseIdentifier: String(describing: CommonTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        addTableView()
        
        favoriteNewsPresenter?.needsFavoriteNews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favoriteNewsPresenter?.needsFavoriteNews()
    }
}
