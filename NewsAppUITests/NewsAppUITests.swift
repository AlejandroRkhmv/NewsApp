//
//  NewsAppUITests.swift
//  NewsAppUITests
//
//  Created by Александр Рахимов on 22.06.2023.
//

import XCTest

final class NewsAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsVC() throws {
        XCTAssertTrue(app.isOnNews)
    }
    
    func testCheckGoFromNewsVCToDetailVC() throws {
        app.tables.element.tap()
        XCTAssertTrue(app.isOnDetail)
        app.navigationBars["NewsApp.DetailNewsView"].buttons["News"].tap()
        XCTAssertTrue(app.isOnNews)
    }
    
    func testFavoriteNewsVC() throws {
        XCTAssertTrue(app.isOnNews)
        app.tabBars["Tab Bar"].buttons["Favorite News"].tap()
        XCTAssertTrue(app.isOnFavoriteNew)
    }
    
    func testFavoriteNewsVCSwipe() throws {
        XCTAssertTrue(app.isOnNews)
        app.tabBars["Tab Bar"].buttons["Favorite News"].tap()
        XCTAssertTrue(app.isOnFavoriteNew)
    }
    
    func testCheckGoFromFavoriteNewsVCToDetailVC() throws {
        XCTAssertTrue(app.isOnNews)
        app.tabBars["Tab Bar"].buttons["Favorite News"].tap()
        XCTAssertTrue(app.isOnFavoriteNew)
        app.tables.element.tap()
        XCTAssertTrue(app.isOnDetail)
        app.navigationBars["NewsApp.DetailNewsView"].buttons["Favorite News"].tap()
        XCTAssertTrue(app.isOnFavoriteNew)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    var isOnNews: Bool {
        return otherElements["News"].exists
    }
    var isOnFavoriteNew: Bool {
        return otherElements["FavoriteNews"].exists
    }
    var isOnDetail: Bool {
        return otherElements["Detail"].exists
    }
}
