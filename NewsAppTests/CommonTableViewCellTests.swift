//
//  CommonTableViewCellTests.swift
//  NewsAppTests
//
//  Created by Александр Рахимов on 25.06.2023.
//

import XCTest
@testable import NewsApp

final class CommonTableViewCellTests: XCTestCase {

    var viewController: NewsViewController!
    var cell: CommonTableViewCell!
    
    override func setUpWithError() throws {
        viewController = NewsViewController()
        viewController.loadViewIfNeeded()
        let tableView = viewController.tableView
        let dataSource = FakeDataSource()
        tableView.dataSource = dataSource
        
        cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommonTableViewCell.self), for: IndexPath(row: 0, section: 0)) as? CommonTableViewCell
    }

    override func tearDownWithError() throws {
        viewController = nil
        cell = nil
        try super.tearDownWithError()
    }
    
    func testCellHasTitleLable() {
        XCTAssertNotNil(cell.descriptionLabel)
    }
    
    func testCellHasCreatorLable() {
        XCTAssertNotNil(cell.creatorLabel)
    }
    
    func testCellHasDateLable() {
        XCTAssertNotNil(cell.dateLabel)
    }
    
    func testCellHasImageView() {
        XCTAssertNotNil(cell.imageNew)
    }
    
    func testCellHasActivityIndicatorView() {
        XCTAssertNotNil(cell.activityIndicator)
    }
    
    func testCheckFillCellElements() {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "imageURL")
        let news = News(news: newsAPI)
        
        cell.fillCell(from: news)
        
        XCTAssertEqual(cell.descriptionLabel.text, "title")
        XCTAssertEqual(cell.creatorLabel.text, "creator")
        XCTAssertEqual(cell.dateLabel.text, "pubDate")
        XCTAssertEqual(cell.urlForImage, "imageURL")
    }
    
    func testCheckFillCellImageFromCoreData() {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "")
        let news = News(news: newsAPI)
        
        let image = UIImage(named: "noImage")
        guard let data = image?.pngData() else { return }
        news.imageData = data
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertEqual(self.cell.imageNew.image?.pngData(), data)
        }
    }
    
    func testCheckFillCellNoImage() {
        let newsAPI = APINews(title: "title", link: "link", creator: ["creator"], description: "description", content: "content", pubDate: "pubDate", imageURL: "")
        let news = News(news: newsAPI)
        
        let image = UIImage(named: "noImage")
        guard let data = image?.pngData() else { return }
        
        cell.fillCell(from: news)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertEqual(self.cell.imageNew.image?.pngData(), data)
        }
    }

}

extension CommonTableViewCellTests {
    
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
