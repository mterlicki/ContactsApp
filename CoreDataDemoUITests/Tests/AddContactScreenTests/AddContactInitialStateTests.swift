//
//  AddContactTest.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 10/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class AddContactInitialStateTests: BaseTest {

    // Navigation bar
    func testNavigationBarHasTitle() throws {
        let navigationBarTitle = "Add contact"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .navigationBarHasTitle(navigationBarTitle)
    }

    func testNameTextFieldHasProperPlaceholder() throws {
        let placeholderValue = "Type name"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .nameTextFieldPlaceholderEqualsTo(placeholderValue)
    }

    func testNameErrorLabelShowsRequiredFieldMessage() throws {
        let errorLabelValue = "Required"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .nameErrorLabelValueEqualsTo(errorLabelValue)
    }

    func testAgeTextFieldHasInitialValue() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .ageTextFieldValueEqualsTo("18")
    }

    func testGenderTextFiledHasProperPlaceholder() throws {
        let placeholderValue = "Type men/woman/nn"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .genderTextFieldPalaceholderEqualsTo(placeholderValue)
    }

    func testGenderErrorLabelShowsRequiredFieldMessage() throws {
        let errorLabelValue = "Required"

        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .genderErrorLabelValueEqualsTo(errorLabelValue)
    }

}
