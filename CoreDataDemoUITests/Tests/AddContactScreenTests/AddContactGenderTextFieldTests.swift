//
//  AddContactGenderTextFieldTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 07/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class AddContactGenderTextFieldTests: BaseTest {

    func testTypingEmptyGenderShowsError() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .tapGenderTextField()
            .typeGender("")
            .tapNameTextField()
            .genderErrorLabelValueEqualsTo("Required")
    }

    func testErrorLabelIsEmptyAfterTypingMen() throws {
        let gender = "men"

        ContactListScreen(app: app)
            .tapAddContact()
            .tapGenderTextField()
            .typeGender(gender)
            .genderErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelIsEmptyAfterTypingWoman() throws {
        let gender = "woman"

        ContactListScreen(app: app)
            .tapAddContact()
            .tapGenderTextField()
            .typeGender(gender)
            .genderErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelIsEmptyAfterTypingNN() throws {
        let gender = "nn"

        ContactListScreen(app: app)
            .tapAddContact()
            .tapGenderTextField()
            .typeGender(gender)
            .genderErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsMessageWhenTypedGenderIsEmpty() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeGender("")
            .tapNameTextField()
            .nameErrorLabelValueEqualsTo("Required")
    }

    func testErrorLabelIsEmptyAfterRetypingValidGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeGender("")
            .tapNameTextField()
            .typeGender("men")
            .genderErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsMessageAfterDeletingGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeGender("woman")
            .clearGender()
            .genderErrorLabelValueEqualsTo("Gender is required")
    }

    func testErrorLabelIsEmptyAfterSavingWithErrorWithEmptyName() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("")
            .typeGender("nn")
            .tapSave()
            .tapAlertOkButton()
            .genderErrorLabelValueEqualsTo(" ")
    }

    func testErrorLabelShowsErrorAfterSavingWithEmptyGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .typeGender(" ")
            .tapSave()
            .tapAlertOkButton()
            .genderErrorLabelValueEqualsTo("Invalid gender, type: men/woman/nn")
    }

    func testTypingSpecialCharacktersShowsError() throws {
        let gender = "!@#$%&*()_+-=[]\\{}|;'<>?,./"

        ContactListScreen(app: app)
            .tapAddContact()
            .typeGender(gender)
            .genderTextFiledValueEqualsTo(gender)
    }

    func testRetypingAppendsGender() throws {
        ContactListScreen(app: app)
            .tapAddContact()
            .typeGender("wo")
            .tapNameTextField()
            .typeGender("man")
            .genderTextFiledValueEqualsTo("woman")
    }
}
