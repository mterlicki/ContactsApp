//
//  BaseTest.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest
import CoreDataDemo

class BaseTest: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }
}
