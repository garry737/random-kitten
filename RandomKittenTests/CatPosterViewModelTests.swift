//
//  CatPosterViewModelTests.swift
//  RandomKittenTests
//
//  Created by Garry Fanata on 1/24/23.
//

import XCTest
import UIKit
@testable import RandomKitten

class MockAPIHelper: FactAPIHelper {
    var delegate: CatPosterViewModel?
    var factAPICalled = 0
    func getFact() {
        factAPICalled += 1
    }
}

class CatPosterViewModelTests: XCTestCase {
    var mockAPIHelper: MockAPIHelper!

    override func setUpWithError() throws {
        mockAPIHelper = MockAPIHelper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let catPosterVC = CatPosterViewController()
        catPosterVC.posterVM = CatPosterViewModel(apiHelper: mockAPIHelper)
        catPosterVC.updateViewModel()
        XCTAssertEqual(mockAPIHelper.factAPICalled, 1)
        catPosterVC.handleTap()
        XCTAssertEqual(mockAPIHelper.factAPICalled, 2)
        catPosterVC.posterVM.getPoster(fact: "yes")
        XCTAssertNotEqual(catPosterVC.posterVM.lastCat,0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
