//
//  ContactListTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
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
}
