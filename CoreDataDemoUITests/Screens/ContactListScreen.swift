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
    
    func tapAddContact() -> AddContactScreen {
        tapButton(Identifiers.addContact)
        return AddContactScreen(app: app)
    }
    
    func selectContact(_ name: String) -> EditPersonScreen {
        tapTableViewCell(Identifiers.contactList, name)
        return EditPersonScreen(app: app)
    }
    
    func selectContact(_ index: Int) -> EditPersonScreen {
        tapTableViewCell(Identifiers.contactList, index)
        return EditPersonScreen(app: app)
    }
    
    func numberOfContacts() -> Int {
        return numberOfCells(Identifiers.contactList)
    }
    
    func swipeToDeleteContact(_ index:Int) -> Self {
        swipeLeftCell(Identifiers.contactList, index)
        return self
    }
    
    
    func deleteContact(_ index: Int) -> Self {
        swipeLeftCell(Identifiers.contactList, index)
        tapTableViewCellButton(Identifiers.contactList, index, Identifiers.deleteButton)
        return self
    }
    
    func swipeToDeleteContact(_ name:String) -> Self {
        swipeLeftCell(Identifiers.contactList, name)
        return self
    }
    
    // MARK: Assertions

    func verifyContactsName(_ name:String) {
        tableViewCellLabelHasValue(Identifiers.contactList, name, Identifiers.personName, name)
    }
    
    func verifyDeleteButtonIsHittable(){
        XCTAssertTrue(app.buttons[Identifiers.deleteButton].isHittable)
    }
    
    func verifyNumberOfContactsAreGraterThan(_ number:Int){
        XCTAssertTrue(app.tables[Identifiers.contactList].cells.count > number)
    }
    
    func verifyNumberOfContactsEquals(_ number:Int){
        XCTAssertTrue(app.tables[Identifiers.contactList].cells.count == number)
    }
    
    func verifyContactWithNameExists (_ name:String){
        tableViewCellExist(Identifiers.contactList, name)
    }
    
    func verifyContactWithNameDoesNotExists (_ name:String){
        tableViewCellDoesNotExist(Identifiers.contactList, name)
    }
    
    func verifyNameOfContactOnPosition (_ name:String, _ position: Int){
        tableViewCellLabelHasValue(Identifiers.contactList, position, Identifiers.personName, name)
    }
}
