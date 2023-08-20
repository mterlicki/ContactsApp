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

    private struct Identifiers {
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
        XCTContext.runActivity(named: "Tap Add contact button") { _ in
            tapButton(Identifiers.addContact)
        }
        return self
    }

    @discardableResult
    func selectContact(_ name: String) -> Self {
        XCTContext.runActivity(named: "Select contact: \(name)") { _ in
            tapTableViewCell(Identifiers.contactList, name)
        }
        return self
    }

    @discardableResult
    func selectContact(_ index: Int) -> Self {
        XCTContext.runActivity(named: "Select contact on position: \(index)") { _ in
            tapTableViewCell(Identifiers.contactList, index)
        }
        return self
    }

    @discardableResult
    func numberOfContacts() -> Int {
        XCTContext.runActivity(named: "Get number of contacts") { _ in
            return numberOfCells(Identifiers.contactList)
        }
    }

    @discardableResult
    func swipeToDeleteContact(_ index: Int) -> Self {
        XCTContext.runActivity(named: "Swipe left contact on index: \(index)") { _ in
            swipeLeftCell(Identifiers.contactList, index)
        }
        return self
    }

    @discardableResult
    func deleteContact(_ index: Int) -> Self {
        XCTContext.runActivity(named: "Swipe left and delete contact on index: \(index)") { _ in
            swipeLeftCell(Identifiers.contactList, index)
            tapTableViewCellButton(Identifiers.contactList, index, Identifiers.deleteButton)
        }
        return self
    }

    @discardableResult
    func swipeToDeleteContact(_ name: String) -> Self {
        XCTContext.runActivity(named: "Swipe left contact: \(name)") { _ in
            swipeLeftCell(Identifiers.contactList, name)
        }
        return self
    }

    // MARK: Assertions

    @discardableResult
    func verifyContactsName(_ name: String) -> Self {
        XCTContext.runActivity(named: "Verify if Name label of cell has name: \(name)") { _ in
            tableViewCellLabelHasValue(Identifiers.contactList, name, Identifiers.personName, name)
        }
        return self
    }

    @discardableResult
    func verifyDeleteButtonIsHittable() -> Self {
        XCTContext.runActivity(named: "Verify if Delete button is hittable") { _ in
            XCTAssertTrue(app.buttons[Identifiers.deleteButton].isHittable)
        }
        return self
    }

    @discardableResult
    func verifyNumberOfContactsAreGraterThan(_ number: Int) -> Self {
        XCTContext.runActivity(named: "Verify if number of contacts is grater than \(number)") { _ in
            XCTAssertTrue(app.tables[Identifiers.contactList].cells.count > number)
        }
        return self
    }

    @discardableResult
    func verifyNumberOfContactsEquals(_ number: Int) -> Self {
        XCTContext.runActivity(named: "Verify if number of contacts equals \(number)") { _ in
            XCTAssertTrue(app.tables[Identifiers.contactList].cells.count == number)
        }
        return self
    }

    @discardableResult
    func verifyContactWithNameExists (_ name: String) -> Self {
        XCTContext.runActivity(named: "Verify if contact with name: \(name) exists on list") { _ in
            tableViewCellExist(Identifiers.contactList, name)
        }
        return self
    }

    @discardableResult
    func verifyContactWithNameDoesNotExists (_ name: String) -> Self {
        XCTContext.runActivity(named: "Verify if contact with name: \(name) does not exist on list") { _ in
            tableViewCellDoesNotExist(Identifiers.contactList, name)
        }
        
        return self
    }

    @discardableResult
    func verifyNameOfContactOnPosition (_ name: String, _ position: Int) -> Self {
        XCTContext.runActivity(named: "Verify if name of contact on position: \(position) is \(name)") { _ in
            tableViewCellLabelHasValue(Identifiers.contactList, position, Identifiers.personName, name)
        }
        return self
    }
}
