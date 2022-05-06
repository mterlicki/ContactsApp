//
//  AddContactNameFieldTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 06/05/2022.
//

import XCTest

class AddContactNameFieldTests: BaseTest {

    func testErrorLabelIsEmptyAfterTypingName() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .nameErrorLabelValueEqualsTo("")
    }
    
    func testErrorLabelShowsMassageWhenTypedNameIsEmpty() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("")
            .tapAgeTextField()
            .nameErrorLabelValueEqualsTo("Name is required")
    }
    
    func testErrorLabelIsEmptyAfterRetypingName() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .tapNameTextField()
            .tapAgeTextField()
            .typeName("John")
            .nameErrorLabelValueEqualsTo("")
    }
    
    
    
    func testErrorLabelShowsMessageAfterDeletingName() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .clearName()
            .nameErrorLabelValueEqualsTo("Name is required")
    }
    
    func testErrorLabelIsEmptyAfterSavingWithError() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .typeAge("33")
            .typeGender("men")
            .tapSave()
            .verifyNumberOfContactsEquals(1)
    }
}
