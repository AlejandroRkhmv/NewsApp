//
//  FavoriteNewsTableViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

protocol FavoriteNewsViewControllerProtocol: AnyObject {
    func reloadData()
}

class FavoriteNewsViewController: UIViewController {

    var favoriteNewsPresenter: FavoriteNewsPresenterProtocol?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let favoriteNews = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.square.on.square"), selectedImage: nil)
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

extension FavoriteNewsViewController {
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

extension FavoriteNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = favoriteNewsPresenter?.favoriteNews?.count else { return 0 }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommonTableViewCell.self), for: indexPath) as? CommonTableViewCell else { return UITableViewCell() }
        guard let favoriteNew = favoriteNewsPresenter?.favoriteNews?[indexPath.row] else { return UITableViewCell() }
        cell.fillCell(from: favoriteNew)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let new = favoriteNewsPresenter?.favoriteNews?[indexPath.row] else { return }
        favoriteNewsPresenter?.goToDetailNewsViewController(with: new)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension FavoriteNewsViewController: FavoriteNewsViewControllerProtocol {
    func reloadData() {
        self.tableView.reloadData()
    }
}
