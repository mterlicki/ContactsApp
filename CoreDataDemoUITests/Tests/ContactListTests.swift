//
//  ContactListTests.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest

class ContactListTests: BaseTest {

    func testAddContactButtonOpensForm() throws{
        let contactScreen = ContactListScreen(app: app)
        let addContactScreen = contactScreen.addContact()
        
        XCTAssertTrue(addContactScreen.app.exists)
    }
    
    func testNumerOfContactactsGraterThenZero() throws{
        ContactListScreen(app: app)
            .verifyNumberOfContactsAreGraterThan(0)
    }
    
    func testSwipeLeftShowsDeleteButton() throws{
        ContactListScreen(app: app)
            .swipeToDeleteContact("Adam")
            .verifyDeleteButtonIsHittable()
    }
}
