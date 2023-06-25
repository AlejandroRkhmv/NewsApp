//
//  NewsCreatorTests.swift
//  NewsAppTests
//
//  Created by Александр Рахимов on 25.06.2023.
//

import XCTest
@testable import NewsApp

final class NewsCreatorTests: XCTestCase {
    
    var sut: NewsCreator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NewsCreator()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testCreateNewsForTable() {
        let newsAPIOne = APINews(title: "One", link: "", creator: [""], description: "", content: "", pubDate: "", imageURL: "")
        let newsAPITwo = APINews(title: "Two", link: "", creator: [""], description: "", content: "", pubDate: "", imageURL: "")
        let news = [newsAPIOne, newsAPITwo]
        
        let newsModelAPI = NewsModelAPI(status: "", totalResults: 1, results: news, nextPage: "")
        
        let newsForTable = sut.createNewsForTable(from: newsModelAPI)
        
        XCTAssertEqual(newsForTable[0].title, newsAPIOne.title)
        XCTAssertEqual(newsForTable[1].title, newsAPITwo.title)
    }
}
