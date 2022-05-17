//
//  SearchZipcodeTests.swift
//  SearchZipcodeTests
//
//  Created by 田中大地 on 2022/05/17.
//

import XCTest
@testable import SearchZipcode

class SearchZipcodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testShapeZipcode() {
        let zipcode1 = "1000000"
        XCTAssertEqual(String.shape(zipcode: zipcode1), "〒100-0000")
        
        let zipcode2 = "1234567"
        XCTAssertEqual(String.shape(zipcode: zipcode2), "〒123-4567")
        
        let zipcode3 = "000000"
        XCTAssertEqual(String.shape(zipcode: zipcode3), "〒000-0000")
    }
    
    func testSetAddress() {
        let address1 = "神奈川県"
        let address2 = "横浜市保土ヶ谷区"
        let address3 = ""
        let result1 = ResultView(zipcode: "2400000", address1: address1, address2: address2, address3: address3).setAddress()
        XCTAssertEqual(result1, "神奈川県 横浜市保土ヶ谷区")
        
        let address4 = "神奈川県"
        let address5 = "横浜市保土ヶ谷区"
        let address6 = "星川"
        let result2 = ResultView(zipcode: "2400005", address1: address4, address2: address5, address3: address6).setAddress()
        XCTAssertEqual(result2, "神奈川県 横浜市保土ヶ谷区 星川")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
