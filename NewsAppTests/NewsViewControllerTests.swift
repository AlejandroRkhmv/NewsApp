//
//  NewsViewControllerTests.swift
//  NewsAppTests
//
//  Created by Александр Рахимов on 24.06.2023.
//

import XCTest
@testable import NewsApp

final class NewsViewControllerTests: XCTestCase {

    var sut: NewsViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NewsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedTableViewNotNil() throws {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedActivityIndicatorNotNil() throws {
        XCTAssertNotNil(sut.activityIndicator)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is NewsViewController)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is NewsViewController)
    }
    
    func testNavigationItemTitleForViewController() {
        XCTAssertEqual(sut.navigationItem.title, "News")
    }
}
