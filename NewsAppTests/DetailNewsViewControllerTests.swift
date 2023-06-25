//
//  DetailNewsViewControllerTests.swift
//  NewsAppTests
//
//  Created by Александр Рахимов on 25.06.2023.
//

import XCTest
@testable import NewsApp

final class DetailNewsViewControllerTests: XCTestCase {
    
    var sut: DetailNewsViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailNewsViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testSUTHasScrollView() {
        XCTAssertNotNil(sut.scrollView)
    }
    
    func testSUTHasScrollContainerStackView() {
        XCTAssertNotNil(sut.scrollContainer)
    }
    
    func testSUTHasTitleLabelView() {
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func testSUTHasCreatorLabelView() {
        XCTAssertNotNil(sut.creatorLabel)
    }
    
    func testSUTHasLinkLabelView() {
        XCTAssertNotNil(sut.linkNewsLabel)
    }
    
    func testSUTHasContentLabelView() {
        XCTAssertNotNil(sut.contentLabel)
    }
    
    func testSUTImageView() {
        XCTAssertNotNil(sut.imageNews)
    }
    
    func testCheckSetNeedsDataForDetailNewsViewController() {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "")
        let news = News(news: newsAPI)
        let image = UIImage(named: "noImage")
        guard let data = image?.pngData() else { return }
        news.imageData = data
        sut.setNeedsData(from: news)
        
        XCTAssertEqual(sut.titleLabel.text, "title")
        XCTAssertEqual(sut.creatorLabel.text, "creator")
        XCTAssertEqual(sut.linkNewsLabel.text, "link")
        XCTAssertEqual(sut.contentLabel.text, "content")
        XCTAssertEqual(sut.imageNews.image?.pngData(), data)
    }
    
    func testCheckRightBarButtonNotNill() {
        sut.setMenuButton()
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.menu?.children.count, 2)
    }
}
