//
//  AddContactValidationErrorTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 20/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class AddContactValidationErrorTests: BaseTest {

    func testSavingEmptyContactGeneratesErrorMessageWithProperTitle() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasProperTiltle()
    }

    func testSavingEmptyContactGeneratesErrorMessageWithProperMessage() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasProperMessage()
    }
    
    func testSavingEmptyContactGeneratesErrorMessageWithOkButton() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .tapAgeTextField()
            .clearAge()
            .tapSave()
            .alertHasOkButton()
    }
    
    func testAfterTapingOkButttonScreenIsInInitialState() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .tapSave()
            .tapAlertOkButton()
            .addPersonScreenIsLoaded()
    }
}
