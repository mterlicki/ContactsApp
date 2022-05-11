//
//  AddContactTest.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 10/04/2022.
//

import XCTest

class AddContactInitialStateTests:BaseTest {
    
    // Navigation bar
    func testNavigationBarHasTitle() throws {
        let navigationBarTitle = "Add contact"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .navigationBarHasTitle(navigationBarTitle)
    }
    
    func testNameTextFieldHasProperPlaceholder() throws {
        let placeholderValue = "Type name"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .nameTextFieldPalaceholderEqualsTo(placeholderValue)
    }
    
    func testNameErrorLabelShowsReqiuredFieldMessage() throws{
        let errorLabelValue = "Required"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .nameErrorLabelValueEqualsTo(errorLabelValue)
    }
    
    func testAgeTextFieldHasInitialValue() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .ageTextFieldValueEqualsTo(18)
    }
    
    func testGenderTextFiledHasProperPlaceholder() throws{
        let placeholderValue = "Type men/woman/nn"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .genderTextFieldPalaceholderEqualsTo(placeholderValue)
    }
    
    func testGenderErrorLablelShowsReqiuredFieldMessage() throws{
        let errorLabelValue = "Required"
        
        ContactListScreen(app: app)
            .tapAddContact()
            .genderErrorLabelValueEqualsTo(errorLabelValue)
    }
    
    
}
