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
        navigationItem.title = "News"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Courier new", size: 20)!]
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: String(describing: NewsTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = newsPresenter?.news.count else { return 0 }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self), for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        guard let new = newsPresenter?.news[indexPath.row] else { return UITableViewCell() }
        cell.delegate = self
        cell.fillCell(from: new)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension NewsViewController: NewsViewControllerProtocol {
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension NewsViewController: NewTableViewCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        newsPresenter?.loadImageData(from: urlString, completionHandler: completionHandler)
    }
}
