//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Александр Рахимов on 22.06.2023.
//

import UIKit

final class CommonTableViewCell: UITableViewCell {
    var delegate: NewTableViewCellDelegate?
    let containerLabelsView = UIStackView()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier new", size: 20)
        return label
    }()
    var creatorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier new", size: 15)
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Courier new", size: 10)
        return label
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    var imageNew: UIImageView = {
        let imageNew = UIImageView()
        imageNew.contentMode = .scaleAspectFill
        imageNew.layer.cornerRadius = 10
        imageNew.clipsToBounds = true
        return imageNew
    }()
    
    var urlForImage: String? {
        didSet {
            imageNew.image = nil
            activityIndicator.startAnimating()
            imageNew.backgroundColor = .gray
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
        setContainerLabelsView()
        addSubLabelsOnContainerLabelsView()
        serDateLabel()
        makeActivityIndicator()
    }
    
    // MARK: - Fill Cell
    func fillCell(from new: News) {
        var creatorLabel = new.creator.reduce("") { $0 + " " + $1}
        creatorLabel.removeFirst()
        self.creatorLabel.text = creatorLabel
        self.descriptionLabel.text = new.title
        self.dateLabel.text = new.date
        if let dataForImage = new.imageData {
            DispatchQueue.main.async {
                self.imageNew.image = UIImage(data: dataForImage)
            }
        } else {
            guard new.imageURL != "" else {
                DispatchQueue.main.async {
                    self.imageNew.image = UIImage(named: "noImage")
                    self.imageNew.backgroundColor = self.contentView.backgroundColor
                    self.activityIndicator.stopAnimating()
                }
                return
            }
            self.urlForImage = new.imageURL
        }
    }
}
