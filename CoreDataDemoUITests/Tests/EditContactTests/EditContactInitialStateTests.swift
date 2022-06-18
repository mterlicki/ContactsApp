//
//  EditContactInitialStateTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 26/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class EditContactInitialStateTests: BaseTest {

    func testEditContactHasInitialState() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave("John", "22", "men")
            .selectContact("John")
            .editContactHasInitialState()
    }
    
    func testContactsNameShowsSelectedContactName() throws{
        let name = "John"
        let age = "22"
        let gender = "men"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave(name, age, gender)
            .selectContact(name)
            .verifyContactNameLabelHasValue(name)
    }
    
    func testContactsAgeShowsSelectedContactName() throws{
        let name = "John"
        let age = "22"
        let gender = "men"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave(name, age, gender)
            .selectContact(name)
            .verifyContactAgeLabelHasValue(age)
    }
}
