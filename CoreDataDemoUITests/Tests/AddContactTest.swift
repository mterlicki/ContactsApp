//
//  AddContactTest.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 10/04/2022.
//

import XCTest

class AddContactTest:BaseTest {
 
    func testAddContact() throws {
        ContactListScreen(app: app)
            .addContact()
            .typeName("Adam")
            .typeAge("21")
            .typeGender("men")
    }
    
    
    func testAddContact2() throws{
        
    }
    
    func testGender() throws{
        
    }

}
