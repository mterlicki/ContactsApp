//
//  ContactListScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest
import CoreDataDemo

struct ContactListScreen: BaseScreen {
    let app: XCUIApplication

    // MARK: Identifiers

    private enum Identifiers {
        static let navigationBar = "Contacts"
        static let addContact = "addContactButton"

        static let contactList = "contactTableView"

        static let personCell = "personCell"
        static let deleteButton = "Delete"

        static let personName = "personNameLabel"
        static let personAge = "personAgeLabel"
        static let personGender = "pesonGenderLabel"
    }

    // MARK: Handlers

    @discardableResult
    func tapAddContact() -> Self {
        tapButton(Identifiers.addContact)
        return self
    }

    @discardableResult
    func selectContact(_ name: String) -> Self {
        tapTableViewCell(Identifiers.contactList, name)
        return self
    }

    @discardableResult
    func selectContact(_ index: Int) -> Self {
        tapTableViewCell(Identifiers.contactList, index)
        return self
    }

    func numberOfContacts() -> Int {
        return numberOfCells(Identifiers.contactList)
    }

    @discardableResult
    func swipeToDeleteContact(_ index: Int) -> Self {
        swipeLeftCell(Identifiers.contactList, index)
        return self
    }

    @discardableResult
    func deleteContact(_ index: Int) -> Self {
        swipeLeftCell(Identifiers.contactList, index)
        tapTableViewCellButton(Identifiers.contactList, index, Identifiers.deleteButton)
        return self
    }

    @discardableResult
    func swipeToDeleteContact(_ name: String) -> Self {
        swipeLeftCell(Identifiers.contactList, name)
        return self
    }

    // MARK: Assertions

    @discardableResult
    func verifyContactsName(_ name: String) -> Self {
        tableViewCellLabelHasValue(Identifiers.contactList, name, Identifiers.personName, name)
        return self
    }

    @discardableResult
    func verifyDeleteButtonIsHittable() -> Self {
        XCTAssertTrue(app.buttons[Identifiers.deleteButton].isHittable)
        return self
    }

    @discardableResult
    func verifyNumberOfContactsAreGraterThan(_ number: Int) -> Self {
        XCTAssertTrue(app.tables[Identifiers.contactList].cells.count > number)
        return self
    }

    @discardableResult
    func verifyNumberOfContactsEquals(_ number: Int) -> Self {
        XCTAssertTrue(app.tables[Identifiers.contactList].cells.count == number)
        return self
    }

    @discardableResult
    func verifyContactWithNameExists (_ name: String) -> Self {
        tableViewCellExist(Identifiers.contactList, name)
        return self
    }

    @discardableResult
    func verifyContactWithNameDoesNotExists (_ name: String) -> Self {
        tableViewCellDoesNotExist(Identifiers.contactList, name)
        return self
    }

    @discardableResult
    func verifyNameOfContactOnPosition (_ name: String, _ position: Int) -> Self {
        tableViewCellLabelHasValue(Identifiers.contactList, position, Identifiers.personName, name)
        return self
    }
}
