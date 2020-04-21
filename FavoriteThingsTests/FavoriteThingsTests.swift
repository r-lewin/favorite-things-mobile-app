//
//  FavoriteThingsTests.swift
//  FavoriteThingsTests
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import XCTest
@testable import FavoriteThings

private let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
private let documentFolderURL = urls.first!
private let fileURL = documentFolderURL.appendingPathComponent("testfruits.json")
var testFruit = Fruit()
var fruitBowl = FruitDirectory()

class FavoriteThingsTests: XCTestCase {

    override func setUpWithError() throws {
        testFruit.name = "Apple"
        testFruit.family = "Appy"
        testFruit.genus = "Happy"
        testFruit.taste = "Crunchy"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFruitName() {
        XCTAssertEqual(testFruit.name, "Apple")
   }
       
    func testFruitFamily() {
        XCTAssertEqual(testFruit.family, "Appy")
    }

    func testFruitGenus() {
        XCTAssertEqual(testFruit.genus, "Happy")
    }

    func testFruitTaste() {
        XCTAssertEqual(testFruit.taste, "Crunchy")
    }

    func testFruitPicURL() {
        XCTAssertEqual(testFruit.picURL, "")
    }

    func testFruitEmptyNote() {
        XCTAssertEqual(testFruit.note, "")
    }

    func testFruitNote() {
        testFruit.note = "This is an apple"
        XCTAssertEqual(testFruit.note, "This is an apple")
    }

    func testFruitDirectoryEmpty() {
        XCTAssert(fruitBowl.fruits.count == 0)
    }
    
    func testEncoding() {
        do {
          let json = JSONEncoder()
          let data = try json.encode(fruitBowl)
          try data.write(to: fileURL)
        } catch {
          print("Got \(error)")
        }
    }
    
    func testDecoding() {
        do{
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedFruits = try decoder.decode(FruitDirectory.self, from: data)
            XCTAssert(decodedFruits.fruits.count == 0)
        } catch {
            print("Got \(error)")
        }
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
