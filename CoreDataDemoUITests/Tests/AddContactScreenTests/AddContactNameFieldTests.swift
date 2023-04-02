//
//  AddContactNameFieldTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 06/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class AddContactNameFieldTests: BaseTest {

    func testErrorLabelIsEmptyAfterTypingName() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("John")
            .nameErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsMessageWhenTypedNameIsEmpty() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("")
            .tapAgeTextField()
            .nameErrorLabelValueEqualsTo("Name is required")
    }

    func testErrorLabelIsEmptyAfterRetypingName() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapNameTextField()
            .tapAgeTextField()
            .typeName("John")
            .nameErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsMessageAfterDeletingName() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("John")
            .clearName()
            .nameErrorLabelValueEqualsTo("Name is required")
    }

    func testErrorLabelIsEmptyAfterSavingWithErrorWithEmptyGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("John")
            .tapSave()
            .tapAlertOkButton()
            .nameErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsErrorAfterSavingWithEmptyName() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapNameTextField()
            .tapSave()
            .tapAlertOkButton()
            .nameErrorLabelValueEqualsTo("Name is required")
    }

    func testTypingLongName() throws {
        let name = "John Emanuel Hernandez the third to the crown"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName(name)
            .nameTextFiledValueEqualsTo(name)
    }

    func testTypingSpecialCharackters() throws {
        let name = "!@#$%&*()_+-=[]\\{}|;'<>?,./"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName(name)
            .nameTextFiledValueEqualsTo(name)
    }

    func testRetypingAppendsName() throws {
        let firstName = "John Emanuel"
        let secondName = " Snow"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName(firstName)
            .tapAgeTextField()
            .typeName(secondName)
            .nameTextFiledValueEqualsTo("\(firstName)\(secondName)")
    }
}
