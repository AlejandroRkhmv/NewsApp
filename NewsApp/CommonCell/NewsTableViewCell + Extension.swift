//
//  NewsTableViewCell + Extension.swift
//  NewsApp
//
//  Created by Александр Рахимов on 24.06.2023.
//

import Foundation

extension CommonTableViewCell {
    
    func setNewsImage() {
        imageNew.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageNew)
        imageNew.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageNew.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageNew.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageNew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
    }
    
    func setContainerLabelsView() {
        containerLabelsView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerLabelsView)
        containerLabelsView.leadingAnchor.constraint(equalTo: imageNew.trailingAnchor, constant: 10).isActive = true
        containerLabelsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: containerLabelsView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 30).isActive = true
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
        dateLabel.topAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        contentView.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: imageNew.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageNew.centerYAnchor).isActive = true
    }
}
