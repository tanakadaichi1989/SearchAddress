//
//  SearchZipcodeUITests.swift
//  SearchZipcodeUITests
//
//  Created by 田中大地 on 2022/05/17.
//

import XCTest
@testable import SearchZipcode

class SearchZipcodeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCUIDevice.shared.orientation = .portrait
        UIPasteboard.general.string = nil

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let buttonExecute = app/*@START_MENU_TOKEN@*/.buttons["buttonExecute"]/*[[".buttons[\"検索\"]",".buttons[\"buttonExecute\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let buttonCopyResult = app.buttons["buttonCopyResult"]
        let buttonCloseResultView = app.buttons["buttonCloseResultView"]

        // Use XCTAssert and related functions to verify your tests produce the correct results.d
        let textfield = XCUIApplication().textFields.matching(identifier: "textFieldEnterZipcode").firstMatch
        
        // 郵便番号 240-0000 神奈川県 横浜市保土ケ谷区
        textfield.tap()
        textfield.typeText("2400000")
        app.typeText("\n")
        buttonExecute.tap()
        sleep(5)
        buttonCopyResult.tap()
        
        guard let result = UIPasteboard.general.string else { return }
        XCTAssertNotNil(result)
        XCTAssertEqual(result,"神奈川県 横浜市保土ケ谷区")
        buttonCloseResultView.tap()
        
        // テキストフィールドに入力した郵便番号の消去
        textfield.tap()
        let strForClear = String(repeating: XCUIKeyboardKey.delete.rawValue, count: (textfield.value as? String)?.count ?? 0)
        textfield.typeText(strForClear)
        
        // 郵便番号 240-0005 神奈川県 横浜市保土ケ谷区 神戸町
        textfield.tap()
        textfield.typeText("2400005")
        app.typeText("\n")
        buttonExecute.tap()
        sleep(5)
        buttonCopyResult.tap()
        
        guard let result = UIPasteboard.general.string else { return }
        XCTAssertNotNil(result)
        XCTAssertEqual(result,"神奈川県 横浜市保土ケ谷区 神戸町")
        buttonCloseResultView.tap()
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
