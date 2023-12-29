//
//  ContactListTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class ContactListTests: BaseTest {

    func testAddContactButtonOpensForm() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .addPersonScreenIsLoaded()
    }

    func testEmptyListHasZeroContacts() throws {
        ContactListScreen(app: app)
            .verifyNumberOfContactsEquals(0)
    }

    func testAfterSavingContactIsVisibleOnList() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("John")
            .tapIncreaseAgeWith(5)
            .typeGender("men")
            .tapSave()
        ContactListScreen(app: app)
            .verifyNumberOfContactsEquals(1)
    }

    func testAfterCancelingAddContactFormContactIsNotAdded() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .typeName("John")
            .tapIncreaseAge()
            .typeGender("men")
            .tapCancel()
        ContactListScreen(app: app)
            .verifyNumberOfContactsEquals(0)
    }

    func testAddedSecondContactIsAddedAtTheEndOfList() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .fillFormAndSave("John", "21", "men")
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .fillFormAndSave("Alex", "32", "men")
        ContactListScreen(app: app)
            .verifyNameOfContactOnPosition("Alex", 1)
    }

    func testAfterDeletingContactIsNotAvailableOnList() throws {
        ContactListScreen(app: app)
            .tapAddContact()
        AddContactScreen(app: app)
            .fillFormAndSave("John", "12", "men")
        ContactListScreen(app: app)
            .deleteContact(0)
            .tapAddContact()
        AddContactScreen(app: app)
            .tapCancel()
        ContactListScreen(app: app)
            .verifyContactWithNameDoesNotExists("John")
    }
}
