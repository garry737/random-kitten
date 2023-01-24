//
//  RandomKittenTests.swift
//  RandomKittenTests
//
//  Created by Garry Fanata on 1/24/23.
//

import XCTest
@testable import RandomKitten

class MockAPIHelper: FactAPIHelper {
    var delegate: CatPosterViewModel?
    var factAPICalled = 0
    func getFact() {
        factAPICalled += 1
    }
}

class RandomKittenTests: XCTestCase {
    var mockAPIHelper: MockAPIHelper!

    // Injects Mock API Helper instead of calling real API
    override func setUpWithError() throws {
        mockAPIHelper = MockAPIHelper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Tests if the API to get the fact was called
    func testFactAPI() throws {
        let catPosterVC = CatPosterViewController()
        catPosterVC.posterVM = CatPosterViewModel(apiHelper: mockAPIHelper)
        catPosterVC.updateViewModel()
        XCTAssertEqual(mockAPIHelper.factAPICalled, 1)
    }

    // Tests if tapping the view calls the API to get the fact
    func testTap() throws {
        let catPosterVC = CatPosterViewController()
        catPosterVC.posterVM = CatPosterViewModel(apiHelper: mockAPIHelper)
        catPosterVC.handleTap()
        XCTAssertEqual(mockAPIHelper.factAPICalled, 1)
    }

    // Tests if a random cat picture URL is generated
    func testGetPoster() throws {
        let catPosterVC = CatPosterViewController()
        catPosterVC.posterVM = CatPosterViewModel(apiHelper: mockAPIHelper)
        catPosterVC.posterVM.getPoster(fact: "yes")
        XCTAssertNotEqual(catPosterVC.posterVM.lastCat,0)
    }
}
