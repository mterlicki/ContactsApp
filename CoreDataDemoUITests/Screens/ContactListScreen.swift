//
//  ContactListScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest
import CoreDataDemo

struct ContactListScreen: Screen {
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
    
    func tapAddContact() -> AddPersonScreen {
        app.buttons[Identifiers.addContact].tap()
        return AddPersonScreen(app: app)
    }
    
    func selectContact(_ name: String) -> EditPersonScreen {
        app.tables[Identifiers.contactList].cells[name].tap()
        return EditPersonScreen(app: app)
    }
    
    func selectContact(_ index: Int) -> EditPersonScreen {
        app.tables[Identifiers.contactList].cells.element(boundBy: index).tap()
        return EditPersonScreen(app: app)
    }
    
    func numberOfContacts() -> Int {
        return app.tables[Identifiers.contactList].cells.count
    }
    
    func swipeToDeleteContact(_ index:Int) -> Self {
        app.tables[Identifiers.contactList].cells.element(boundBy: index).swipeLeft()
        return self
    }
    
    
    func deleteContact(_ index: Int) -> Self {
        app.tables[Identifiers.contactList].cells.element(boundBy: index).swipeLeft()
        app.tables[Identifiers.contactList].buttons[Identifiers.deleteButton].tap()
        return self
    }
    
    func swipeToDeleteContact(_ name:String) -> Self {
        app.tables[Identifiers.contactList].cells[name].swipeLeft()
        return self
    }
    
    // MARK: Assertions

    func verifyContactsName(_ name:String) -> Self {
        
        return self
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
}
