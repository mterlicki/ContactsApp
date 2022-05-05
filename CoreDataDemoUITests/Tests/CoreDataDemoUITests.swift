//
//  CoreDataDemoUITests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 10/09/2021.
//

import XCTest

class CoreDataDemoUITests: BaseTest {

    func testExample() throws {
        
            
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
