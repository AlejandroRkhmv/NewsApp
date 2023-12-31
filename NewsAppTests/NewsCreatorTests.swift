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
    
    func commonFunctionForCreatingFavoriteNews() -> (FavoriteNew, News) {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "")
        let news = News(news: newsAPI)
        let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext
        let favoriteNews = FavoriteNew(context: context!)
        return (favoriteNews, news)
    }
    
    func testCheckCreateFavoriteNewsForCoreData() {
        let allNews = commonFunctionForCreatingFavoriteNews()
        let favoriteNews = allNews.0
        let news = allNews.1
        
        sut.createFavoriteNewsForCoreData(favoriteNews: favoriteNews, news: news)
        
        XCTAssertEqual(favoriteNews.title, news.title)
        XCTAssertEqual(favoriteNews.content, news.content)
    }
    
    func testCheckCreateNewsForFavoriteNewsViewControllerFromNewsFromCoreData() {
        let allNews = commonFunctionForCreatingFavoriteNews()
        let favoriteNews = allNews.0
        let news = allNews.1
        
        sut.createFavoriteNewsForCoreData(favoriteNews: favoriteNews, news: news)
        
        let favoriteNewsArray = [favoriteNews]
        let newsForFavoriteNewsViewController = sut.createFavoriteNews(from: favoriteNewsArray)
        
        XCTAssertEqual(favoriteNewsArray[0].descript, newsForFavoriteNewsViewController[0].description)
    }
    
    func testCheckCreateInfoNewsObject() {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "")
        let newsFromApi = NewsModelAPI(status: "status", totalResults: 100, results: [newsAPI], nextPage: "nextPage")
        let infoNews = sut.createInfoNews(from: newsFromApi)
        
        XCTAssertEqual(newsFromApi.totalResults, infoNews.totalResults)
    }
}
