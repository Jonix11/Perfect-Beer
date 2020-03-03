//
//  BeerTests.swift
//  Perfect BeerTests
//
//  Created by Jon Gonzalez on 02/03/2020.
//  Copyright © 2020 Jon Gonzalez. All rights reserved.
//

import XCTest
@testable import Perfect_Beer

class BeerTests: XCTestCase {
    
    var beer1: Beer!
    var date = Date()

    override func setUp() {
        let stringDate = DateFormatter.punkAPIDateFormatter.string(from: date)
        let dateFormatted = DateFormatter.punkAPIDateFormatter.date(from: stringDate)
        beer1 = Beer(beerId: 1, name: "Buzz", tagline: "A Real Bitter Experience.", firstBrewed: dateFormatted, description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", image: "https://images.punkapi.com/v2/keg.png", abv: 4.5, foodPairing: ["Spicy chicken tikka masala", "Grilled chicken quesadilla", "Caramel toffee cake"])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBeerExistence() {
        XCTAssertNotNil(beer1)
    }
    
    func testBeerEncodeDecode() {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            // Encode
            let beerData = try encoder.encode(beer1)
            XCTAssertNotNil(beerData)
            
            // Decode
            let beer = try decoder.decode(Beer.self, from: beerData)
            XCTAssertNotNil(beer)
            XCTAssertNotNil(beer.beerId)
            XCTAssertNotNil(beer.name)
            XCTAssertNotNil(beer.tagline)
            XCTAssertNotNil(beer.firstBrewed)
            XCTAssertNotNil(beer.description)
            XCTAssertNotNil(beer.image)
            XCTAssertNotNil(beer.abv)
            XCTAssertNotNil(beer.foodPairing)
        } catch {
            XCTFail()
        }
    }

}
