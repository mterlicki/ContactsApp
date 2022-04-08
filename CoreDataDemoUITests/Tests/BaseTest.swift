//
//  BaseTest.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }
}
