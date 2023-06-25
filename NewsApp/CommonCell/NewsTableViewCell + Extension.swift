//
//  NewsTableViewCell + Extension.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import UIKit

// MARK: - Extension CommonTableViewCell
extension CommonTableViewCell {
    func setNewsImage() {
        imageNew.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageNew)
        NSLayoutConstraint.activate([
        imageNew.widthAnchor.constraint(equalToConstant: 120),
        imageNew.heightAnchor.constraint(equalToConstant: 100),
        imageNew.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
        imageNew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
        ])
    }
    
    func setContainerLabelsView() {
        containerLabelsView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerLabelsView)
        NSLayoutConstraint.activate([
        containerLabelsView.leadingAnchor.constraint(equalTo: imageNew.trailingAnchor, constant: 10),
        containerLabelsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        contentView.trailingAnchor.constraint(equalTo: containerLabelsView.trailingAnchor, constant: 0),
        contentView.bottomAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 30),
        ])
    }
    
    func addSubLabelsOnContainerLabelsView() {
        containerLabelsView.axis = .vertical
        containerLabelsView.spacing = 5
        containerLabelsView.alignment = .fill
        containerLabelsView.distribution = .fillProportionally
        containerLabelsView.addArrangedSubview(descriptionLabel)
        containerLabelsView.addArrangedSubview(creatorLabel)
    }
    
    func serDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
        dateLabel.topAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 10),
        dateLabel.widthAnchor.constraint(equalToConstant: 150),
        contentView.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
        contentView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
        ])
    }
    
    func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
        activityIndicator.centerXAnchor.constraint(equalTo: imageNew.centerXAnchor),
        activityIndicator.centerYAnchor.constraint(equalTo: imageNew.centerYAnchor),
        ])
    }
}
