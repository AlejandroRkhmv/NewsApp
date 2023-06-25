//
//  NewsViewController + Extensions.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

// MARK: - Extension NewsViewController
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
    
    func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        tableView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
        activityIndicator.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
        activityIndicator.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor),
        ])
        activityIndicator.startAnimating()
    }
}

// MARK: - Extension UITableViewDelegate, UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = newsPresenter?.news.count else { return 0 }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommonTableViewCell.self), for: indexPath) as? CommonTableViewCell else { return UITableViewCell() }
        guard let new = newsPresenter?.news[indexPath.row] else { return UITableViewCell() }
        cell.delegate = self
        cell.fillCell(from: new)
        cell.selectionStyle = .none
        
        // MARK: - Pagination
        guard let countNews = newsPresenter?.news.count else { return UITableViewCell() }
        if indexPath.row == countNews - 1 {
            newsPresenter?.loadNextNews()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let new = newsPresenter?.news[indexPath.row] else { return }
        newsPresenter?.goToDetailNewsViewController(with: new)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - Extension NewsViewControllerProtocol
extension NewsViewController: NewsViewControllerProtocol {
    func reloadData() {
        self.tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }
}

// MARK: - Extension NewTableViewCellDelegate
extension NewsViewController: NewTableViewCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        newsPresenter?.loadImageData(from: urlString, completionHandler: completionHandler)
    }
}
