//
//  AddContactValidationErrorTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 20/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class AddContactValidationErrorTests: BaseTest {

    func testSavingEmptyContactGeneratesErrorMessageWithProperTitle() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasProperTitle()
    }

    func testSavingEmptyContactGeneratesErrorMessageWithProperMessage() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasProperMessage()
    }

    func testSavingEmptyContactGeneratesErrorMessageWithOkButton() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasOkButton()
    }

    func testAfterTapingOkButtonScreenIsInInitialState() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapSave()
            .tapAlertOkButton()
            .addPersonScreenIsLoaded()
    }
}
