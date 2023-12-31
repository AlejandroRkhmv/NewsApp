//
//  DetailNewsViewController.swift
//  NewsApp
//
//  Created by Александр Рахимов on 23.06.2023.
//

import UIKit

final class DetailNewsViewController: UIViewController {

    var detailNewsPresenter: DetailNewsPresenterProtocol?
    
    let scrollView = UIScrollView()
    let scrollContainer = UIStackView()
    let titleLabel = UILabel()
    let creatorLabel = UILabel()
    let imageNews = UIImageView()
    let contentLabel = UILabel()
    let linkNewsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "Detail"
        setMenuButton()
        detailNewsPresenter?.setNeedData()
        setScrollView()
        setTitleLabel()
        setCreatorLabel()
        setimageNew()
        setLinkLabel()
        setContentLabel()
        dynamic()
    }
}
