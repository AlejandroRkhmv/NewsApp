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

class CommonTableViewCell: UITableViewCell {
    var delegate: NewTableViewCellDelegate?
    let containerLabelsView = UIStackView()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier new", size: 20)
        label.textColor = .red
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
            imageNew.backgroundColor = .lightGray
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
            } else {
                DispatchQueue.main.async {
                    self.imageNew.image = UIImage(named: "noImage")
                    self.imageNew.backgroundColor = self.contentView.backgroundColor
                    self.activityIndicator.stopAnimating()
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
    
    func fillCell(from new: New) {
        self.creatorLabel.text = new.creator.reduce("") { $0 + " " + $1 }
        self.descriptionLabel.text = new.title
        self.dateLabel.text = new.date
        guard let dataForImage = new.imageData else {
            guard new.imageURL != "" else {
                DispatchQueue.main.async {
                    self.imageNew.image = UIImage(named: "noImage")
                    self.imageNew.backgroundColor = self.contentView.backgroundColor
                    self.activityIndicator.stopAnimating()
                }
                return
            }
            self.urlForImage = new.imageURL
            return
        }
        imageNew.image = UIImage(data: dataForImage)
    }

}

extension CommonTableViewCell {
    
    private func setNewsImage() {
        imageNew.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageNew)
        
        imageNew.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageNew.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageNew.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageNew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
    }
    
    private func setContainerLabelsView() {
        containerLabelsView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerLabelsView)
        
        containerLabelsView.leadingAnchor.constraint(equalTo: imageNew.trailingAnchor, constant: 10).isActive = true
        containerLabelsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: containerLabelsView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 30).isActive = true
    }
    
    private func addSubLabelsOnContainerLabelsView() {
        containerLabelsView.axis = .vertical
        containerLabelsView.spacing = 5
        containerLabelsView.alignment = .fill
        containerLabelsView.distribution = .fillProportionally
        containerLabelsView.addArrangedSubview(descriptionLabel)
        containerLabelsView.addArrangedSubview(creatorLabel)
    }
    
    private func serDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        dateLabel.topAnchor.constraint(equalTo: containerLabelsView.bottomAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        contentView.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    private func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: imageNew.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageNew.centerYAnchor).isActive = true
    }
}
