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
        app.launch()

        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave(contactName, age, gender)
    }

    func testEditContactHasInitialState() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .editContactHasInitialState()
    }

    func testContactsNameShowsSelectedContactName() throws {

        ContactListScreen(app: app)
            .selectContact(contactName)
            .verifyContactNameLabelHasValue(contactName)
    }

    func testContactsAgeShowsSelectedContactAge() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .verifyContactAgeLabelHasValue(age)
    }

    func testContactsGenderShowsSelectedContactGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave(contactName, age, gender)
            .selectContact(contactName)
            .verifyContactGenderLabelHasValue(gender)
    }

    func testContactsDetailsShowsContactData() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .editContactHasContactData(contactName, age, gender)
    }
}
