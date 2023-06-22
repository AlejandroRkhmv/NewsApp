//
//  FavoriteNewsTableViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

class FavoriteNewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let favoriteNews = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.square.on.square"), selectedImage: nil)
        self.tabBarItem = favoriteNews
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
