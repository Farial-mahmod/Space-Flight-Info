//  Written by Farial Mahmod on 8/15/23.

import XCTest

final class Space_Science_UpdatesUITests: XCTestCase {

    override func setUpWithError() throws {
      
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
      
      // uncomment the line below if need to terminate
      // app.terminate()
      
    }
    
    func testExample() throws {

        // 'app' as an instance of the main app to be tested
        let app = XCUIApplication()
      
        // launching before the test
        app.launch()

        // putting the text value to be tested inside 'titleText'
        let titleText = app.staticTexts["Space Flight Latest Info"]

        // testing the static Text title
        XCTAssertTrue(titleText.exists, "Title not found, re-check.")

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
