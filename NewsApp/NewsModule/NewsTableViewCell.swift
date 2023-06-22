//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

protocol NewTableViewCellDelegate {
    func loadImage(from urlString: String, completionHandler: @escaping ((Data) -> Void))
}

class NewsTableViewCell: UITableViewCell {
    
    var delegate: NewTableViewCellDelegate?
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier new", size: 20)
        label.textColor = .red
        return label
    }()
    
    lazy var creatorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier new", size: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Courier new", size: 10)
        label.textColor = .black
        return label
    }()
    
    lazy var imageNew: UIImageView = {
        let imageNew = UIImageView()
        imageNew.contentMode = .scaleAspectFit
        imageNew.layer.cornerRadius = 10
        imageNew.clipsToBounds = true
        return imageNew
    }()
    
    var urlForImage: String? {
        didSet {
            imageNew.image = nil
            activityIndicator.startAnimating()
            imageNew.backgroundColor = #colorLiteral(red: 0.907659471, green: 0.9076595306, blue: 0.907659471, alpha: 1)
            if let urlForImage = urlForImage {
                DispatchQueue.global().async {
                    self.delegate?.loadImage(from: urlForImage) { data in
                        DispatchQueue.main.async {
                            self.imageNew.image = UIImage(data: data)
                            self.imageNew.backgroundColor = self.contentView.backgroundColor
                            self.activityIndicator.stopAnimating()
                        }
                    }
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setNewsImage()
        setDescriptionLabel()
        setCreatorLabel()
        setDateLabel()
        makeActivityIndicator()
    }
    
    func fillCell(from new: New) {
        self.creatorLabel.text = new.creator.reduce("") { $0 + " " + $1 }
        self.descriptionLabel.text = new.description
        self.dateLabel.text = new.date
        self.urlForImage = new.imageURL
    }

}

extension NewsTableViewCell {
    
    private func setNewsImage() {
        imageNew.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageNew)
        
        imageNew.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width * 0.25).isActive = true
        imageNew.heightAnchor.constraint(equalToConstant: contentView.bounds.size.height).isActive = true
        imageNew.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageNew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width * 0.8).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        contentView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 5).isActive = true
    }
    
    private func setCreatorLabel() {
        creatorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(creatorLabel)
        
        creatorLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width * 0.7).isActive = true
        creatorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        creatorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        contentView.trailingAnchor.constraint(equalTo: creatorLabel.trailingAnchor, constant: 5).isActive = true
    }
    
    private func setDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        dateLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width * 0.7).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10).isActive = true
    }
    
    private func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: imageNew.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageNew.centerYAnchor).isActive = true
    }
}
