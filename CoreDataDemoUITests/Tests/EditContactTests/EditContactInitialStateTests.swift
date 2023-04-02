//
//  EditContactInitialStateTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 26/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class EditContactInitialStateTests: BaseTest {

    let contactName = "John"
    let age = "22"
    let gender = "men"

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launchEnvironment = ["TestData": "1contact.json"]
        app.launch()

    }

    func testEditContactHasInitialState() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
        EditPersonScreen(app: app)
            .editContactHasInitialState()
    }

    func testContactsNameShowsSelectedContactName() throws {

        ContactListScreen(app: app)
            .selectContact(contactName)
        EditPersonScreen(app: app)
            .verifyContactNameLabelHasValue(contactName)
    }

    func testContactsAgeShowsSelectedContactAge() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
        EditPersonScreen(app: app)
            .verifyContactAgeLabelHasValue(age)
    }

    func testContactsGenderShowsSelectedContactGender() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
        EditPersonScreen(app: app)
            .verifyContactGenderLabelHasValue(gender)
    }

    func testContactsDetailsShowsContactData() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
        EditPersonScreen(app: app)
            .editContactHasContactData(contactName, age, gender)
    }
}
