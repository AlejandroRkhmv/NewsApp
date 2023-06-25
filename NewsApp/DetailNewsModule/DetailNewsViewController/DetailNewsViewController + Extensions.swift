//
//  DetailNewsViewController + Extensions.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

// MARK: - Extension DetailNewsViewController
extension DetailNewsViewController {
   func setScrollView() {
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(scrollView)
   
       NSLayoutConstraint.activate([
       scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
       scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
       scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
       scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
       ])
       
       scrollContainer.translatesAutoresizingMaskIntoConstraints = false
       scrollView.addSubview(scrollContainer)
       scrollContainer.distribution = .equalSpacing
       scrollContainer.spacing = 16
       scrollContainer.axis = .vertical
       
       NSLayoutConstraint.activate([
       scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
       scrollContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       ])
   }

   func setTitleLabel() {
       titleLabel.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(titleLabel)

       titleLabel.numberOfLines = 0
       titleLabel.font = UIFont(name: "Courier new", size: 30)
       titleLabel.textAlignment = .center
   }

   func setCreatorLabel() {
       creatorLabel.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(creatorLabel)

       creatorLabel.numberOfLines = 0
       creatorLabel.font = UIFont(name: "Courier new", size: 10)
       creatorLabel.textAlignment = .left
   }

   func setimageNew() {
       imageNews.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(imageNews)

       imageNews.contentMode = .scaleAspectFill
       imageNews.layer.cornerRadius = 10
       imageNews.clipsToBounds = true

       NSLayoutConstraint.activate([
       imageNews.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9),
       imageNews.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3),
       ])
   }

   func setLinkLabel() {
       linkNewsLabel.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(linkNewsLabel)

       linkNewsLabel.numberOfLines = 0
       linkNewsLabel.font = UIFont(name: "Courier new", size: 10)
       linkNewsLabel.textAlignment = .center

       linkNewsLabel.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9).isActive = true
   }

   func setContentLabel() {
       contentLabel.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(contentLabel)

       contentLabel.numberOfLines = 0
       contentLabel.font = UIFont(name: "Courier new", size: 20)
       contentLabel.textAlignment = .left
       contentLabel.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9).isActive = true
   }
    
   func dynamic() {
        let layoutGuide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
           scrollContainer.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 0),
           scrollContainer.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0),
           scrollContainer.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0),
           scrollContainer.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
   func createLinkAttributedStrring(from link: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: link)
        attributedString.addAttribute(.link, value: "", range: NSRange(location: 0, length: link.count))
        return attributedString
    }
}

// MARK: - Extension DetailNewsViewControllerProtocol
extension DetailNewsViewController: DetailNewsViewControllerProtocol {
    func reloadView() {
        NSLayoutConstraint.activate([
        imageNews.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9),
        imageNews.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3),
        ])
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Set Needs Data For DetailNewsViewController
   func setNeedsData(from new: News) {
       self.titleLabel.text = new.title
       var creator = new.creator.reduce("") { $0 + " " + $1 }
       creator.removeFirst()
       self.creatorLabel.text = creator
       self.linkNewsLabel.attributedText = createLinkAttributedStrring(from: new.link)
       self.contentLabel.text = new.content
       guard let data = new.imageData else {
           self.imageNews.heightAnchor.constraint(equalToConstant: 0).isActive = true
           self.imageNews.layoutIfNeeded()
           return }
       self.imageNews.image = UIImage(data: data)
   }
}

// MARK: - Extension DetailNewsViewController Menu Button
extension DetailNewsViewController {
   func setMenuButton() {
       navigationItem.rightBarButtonItem = menuRightBarButtonItems()
       navigationController?.navigationBar.tintColor = .black
   }
   
   func menuRightBarButtonItems() -> UIBarButtonItem {
       let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "line.3.horizontal"), target: self, action: nil, menu: makeDropDownMenu())
       dropDownButtonItem.customView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       return dropDownButtonItem
   }
   
   func makeDropDownMenu() -> UIMenu {
       let addToFavorite = UIAction(title: "add to favorite") { [weak self] _ in
           guard let self = self else { return }
           self.detailNewsPresenter?.saveFavoritesNew()
       }
       let deleteFromFavorite = UIAction(title: "delete from favorite") { [weak self] _ in
           guard let self = self else { return }
           self.detailNewsPresenter?.deleteFavoritesNew()
       }
       return UIMenu(title: "", children: [addToFavorite, deleteFromFavorite])
   }
}
