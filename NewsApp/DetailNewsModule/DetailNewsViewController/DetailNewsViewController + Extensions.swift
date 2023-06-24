//
//  DetailNewsViewController + Extensions.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

extension DetailNewsViewController {
   
   func setScrollView() {
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(scrollView)
   
       scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
       scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
       scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
       scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
       
       
       scrollContainer.translatesAutoresizingMaskIntoConstraints = false
       scrollView.addSubview(scrollContainer)
       scrollContainer.distribution = .equalSpacing
       scrollContainer.spacing = 16
       scrollContainer.axis = .vertical
       
       
       scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
       scrollContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
       imageNew.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(imageNew)

       imageNew.contentMode = .scaleAspectFill
       imageNew.layer.cornerRadius = 10
       imageNew.clipsToBounds = true

       imageNew.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9).isActive = true
       imageNew.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
   }

   func setLinkLabel() {
       linkNewLabel.translatesAutoresizingMaskIntoConstraints = false
       scrollContainer.addArrangedSubview(linkNewLabel)

       linkNewLabel.numberOfLines = 0
       linkNewLabel.font = UIFont(name: "Courier new", size: 10)
       linkNewLabel.textAlignment = .center

       linkNewLabel.widthAnchor.constraint(equalToConstant: scrollContainer.bounds.size.width * 0.9).isActive = true
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

extension DetailNewsViewController: DetailNewsViewControllerProtocol {
   func setNeedsData(from new: News?) {
       guard let new = new else { return }
       self.titleLabel.text = new.title
       self.creatorLabel.text = new.creator.reduce("") { $0 + " " + $1 }
       self.linkNewLabel.attributedText = createLinkAttributedStrring(from: new.link)
       self.contentLabel.text = new.content
       guard let data = new.imageData else {
           self.imageNew.heightAnchor.constraint(equalToConstant: 0).isActive = true
           self.imageNew.layoutIfNeeded()
           return }
       self.imageNew.image = UIImage(data: data)
   }
}

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
