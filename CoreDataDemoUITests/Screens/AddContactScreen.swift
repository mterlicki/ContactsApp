//
//  AddPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest
import CoreDataDemo

struct AddContactScreen: Screen {
    var app: XCUIApplication
    
    // MARK: Identifiers
    
    private enum Identifiers {
        static let navigationBar = "Add contact"
        
        static let nameLabel = "nameLabel"
        static let nameTextField = "nameTextField"
        static let nameErrorLabel = "nameErrorLabel"
        
        static let ageLabel = "ageLabel"
        static let ageTextField = "ageTextField"
        static let ageIncrement = "Increment"
        static let ageDecrement = "Decrement"
        static let ageErrorLabel = "ageErrorLabel"
        
        static let genderLabel = "genderLabel"
        static let genderTextField = "genderTextField"
        static let genderErrorLabel = "genderErrorLabel"
        
        static let cancelButton = "cancelButton"
        static let saveButton = "saveButton"
        
        static let saveErrorAlert = "formErrorAlert"
        static let alertOkButton = "alertOkButton"
    }
    
    
    // MARK: Handlers
    
    func tapCancel() -> Self{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.cancelButton].tap()
        return self
    }
    
    func tapSave() -> ContactListScreen{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.saveButton].tap()
        return ContactListScreen(app: app)
    }
    
    func tapSave() -> Self{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.saveButton].tap()
        return self
    }
    
    func tapNameTextField() -> Self{
        app.textFields[Identifiers.nameTextField].tap()
        return self
    }
    
    func typeName(_ name: String) -> Self{
        app.textFields[Identifiers.nameTextField].tap()
        app.textFields[Identifiers.nameTextField].typeText(name)
        return self
    }
    
    func clearName() -> Self{
        app.textFields[Identifiers.nameTextField].tap()
        
        let value = app.textFields[Identifiers.nameTextField].value as! String
        
        if value.count > 0 {
            for _ in value{
                app.keys["delete"].tap()
            }
        }
        return self
    }
    
    func tapAgeTextField() -> Self{
        app.textFields[Identifiers.ageTextField].tap()
        return self
    }
    
    func typeAge(_ age: String) -> Self{
        app.textFields[Identifiers.ageTextField].tap()
        app.textFields[Identifiers.ageTextField].typeText(age)
        return self
    }
    
    func tapIncreaseAge() -> Self{
        app.buttons[Identifiers.ageIncrement].tap()
        return self
    }
    
    func tapIncreaseAgeWith(_ number: Int) -> Self{
        app.buttons[Identifiers.ageIncrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        return self
    }
    
    func tapDecreaseAge() -> Self{
        app.buttons[Identifiers.ageDecrement].tap()
        return self
    }
    
    func tapDecreaseAgeWith(_ number: Int) -> Self{
        app.buttons[Identifiers.ageDecrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        return self
    }
    
    func tapGenderTextField() -> Self{
        app.textFields[Identifiers.genderTextField].tap()
        return self
    }
    
    func typeGender(_ gender: String) -> Self{
        app.textFields[Identifiers.genderTextField].tap()
        app.textFields[Identifiers.genderTextField].typeText(gender)
        return self
    }
    
    func tapAlertOkButton() -> AddContactScreen{
        app.alerts[Identifiers.saveErrorAlert].buttons[Identifiers.alertOkButton].tap()
        return AddContactScreen(app: app)
    }
    
    // MARK: Assertions
    
    func addPersonScreenIsLoaded(){
        XCTAssertTrue(app.buttons[Identifiers.saveButton].exists)
        XCTAssertTrue(app.buttons[Identifiers.cancelButton].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.nameLabel].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.nameErrorLabel].exists)
        XCTAssertTrue(app.textFields[Identifiers.nameTextField].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.ageLabel].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.ageErrorLabel].exists)
        XCTAssertTrue(app.textFields[Identifiers.ageTextField].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.genderLabel].exists)
        XCTAssertTrue(app.staticTexts[Identifiers.genderErrorLabel].exists)
        XCTAssertTrue(app.textFields[Identifiers.genderTextField].exists)
    }
    
    func nameTextFieldPalaceholderEqualsTo (_ value: String){
        XCTAssertTrue(app.textFields[Identifiers.nameTextField].placeholderValue == value)
    }
    
    func nameTextFiledValueEqualsTo (_ value: String){
        let nameTextFieldValue = app.textFields[Identifiers.nameTextField].value as! String
        
        XCTAssertTrue(nameTextFieldValue == value, "Name text field is not \(value)")
    }
    
    func ageTextFieldValueEqualsTo (_ value: String){
        let text = app.textFields[Identifiers.ageTextField].value as! String
        
        XCTAssertTrue(text == value)
    }
    
    func genderTextFieldPalaceholderEqualsTo (_ value: String){
        XCTAssertTrue(app.textFields[Identifiers.genderTextField].placeholderValue == value)
    }
    
    func nameErrorLabelValueEqualsTo (_ value: String){
        let nameErrorText = app.staticTexts[Identifiers.nameErrorLabel].label
        
        XCTAssertTrue(nameErrorText == value)
    }
    
    func genderErrorLabelValueEqualsTo (_ value: String){
        let genderErrorText = app.staticTexts[Identifiers.genderErrorLabel].label
        
        XCTAssertTrue(genderErrorText == value)
    }
    
    func ageErrorLabelValueEqualsTo (_ value: String){
        let ageErrorText = app.staticTexts[Identifiers.ageErrorLabel].label
        
        XCTAssertTrue(ageErrorText == value)
    }
    
    func navigationBarHasTitle (_ title: String){
        let navigationBarTitle = app.navigationBars[Identifiers.navigationBar].staticTexts[Identifiers.navigationBar].label
        
        XCTAssertTrue(navigationBarTitle == title)
    }
}

