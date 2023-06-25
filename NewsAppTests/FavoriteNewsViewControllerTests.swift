//
//  FavoriteNewsViewControllerTests.swift
//  NewsAppTests
//
//  Created by Александр Рахимов on 25.06.2023.
//

import XCTest
@testable import NewsApp

final class FavoriteNewsViewControllerTests: XCTestCase {

    var sut: FavoriteNewsViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FavoriteNewsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedTableViewNotNil() throws {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is FavoriteNewsViewController)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is FavoriteNewsViewController)
    }
    
    func testNavigationItemTitleForViewController() {
        XCTAssertEqual(sut.navigationItem.title, "Favorite News")
    }
    
}
