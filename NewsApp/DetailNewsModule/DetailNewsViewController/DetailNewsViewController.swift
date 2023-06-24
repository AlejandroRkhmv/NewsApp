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
    let imageNew = UIImageView()
    let contentLabel = UILabel()
    let linkNewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
