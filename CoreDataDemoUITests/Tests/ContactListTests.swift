//
//  ContactListTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class ContactListTests: BaseTest {

    func testAddContactButtonOpensForm() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .addPersonScreenIsLoaded()
    }
    
    func testEmptyListHasZeroContacts() throws{
        ContactListScreen(app: app)
            .verifyNumberOfContactsEquals(0)
    }
    
    func testAfterSavingContactIsVisibleOnList() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .tapIncreaseAgeWith(5)
            .typeGender("men")
            .tapSave()
            .verifyNumberOfContactsEquals(1)
    }
    
    func testAfterCancelingAddContactFormContactIsNotAdded() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .typeName("John")
            .tapIncreaseAge()
            .typeGender("men")
            .tapCancel()
            .verifyNumberOfContactsEquals(0)
    }
    
    func testAddedSecondContactIsAddedAtTheEndOfList() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave("John", "21", "men")
            .tapAddContact()
            .fillFormAndSave("Alex", "32", "men")
            .verifyNameOfContactOnPosition("Alex", 1)
    }
    
    func testAfterDeletingContactNumberOFContactsIsZero() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave("John", "12", "men")
            .deleteContact(0)
            .tapAddContact()
            .tapCancel()
            .verifyContactWithNameDoesNotExists("John")
    }
}
