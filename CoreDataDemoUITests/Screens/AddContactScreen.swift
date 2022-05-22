//
//  AddPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
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
    
    // Naviation bar
    func tapCancel() -> ContactListScreen{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.cancelButton].tap()
        return ContactListScreen(app: app)
    }
    
    func tapSave() -> ContactListScreen{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.saveButton].tap()
        return ContactListScreen(app: app)
    }
    
    func tapSave() -> Self{
        app.navigationBars[Identifiers.navigationBar].buttons[Identifiers.saveButton].tap()
        return self
    }
    
    //Name text field
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
        app.textFields[Identifiers.nameTextField].clearText()
        return self
    }
    
    // Age text field
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
    
    func clearAge() -> Self{
        app.textFields[Identifiers.ageTextField].clearText()
        return self
    }
    
    //Gender text field
    func tapGenderTextField() -> Self{
        app.textFields[Identifiers.genderTextField].tap()
        return self
    }
    
    func typeGender(_ gender: String) -> Self{
        app.textFields[Identifiers.genderTextField].tap()
        app.textFields[Identifiers.genderTextField].typeText(gender)
        return self
    }
    
    func clearGender() -> Self{
        app.textFields[Identifiers.genderTextField].clearText()
        return self
    }
    
    //Alert
    func tapAlertOkButton() -> AddContactScreen{
        app.alerts[Identifiers.saveErrorAlert].buttons[Identifiers.alertOkButton].tap()
        return AddContactScreen(app: app)
    }
    
    // Add contact
    
    func fillFormAndSave (_ name: String, _ age: String, _ gender: String) -> ContactListScreen {
        app.textFields[Identifiers.nameTextField].tap()
        app.textFields[Identifiers.nameTextField].typeText(name)
        app.textFields[Identifiers.ageTextField].tap()
        app.textFields[Identifiers.ageTextField].clearText()
        app.textFields[Identifiers.ageTextField].typeText(age)
        app.textFields[Identifiers.genderTextField].tap()
        app.textFields[Identifiers.genderTextField].typeText(gender)
        app.buttons[Identifiers.saveButton].tap()
        return ContactListScreen(app: app)
        
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
    
    // Name text feield
    
    func nameTextFieldPalaceholderEqualsTo (_ value: String){
        XCTAssertTrue(app.textFields[Identifiers.nameTextField].placeholderValue == value)
    }
    
    func nameTextFiledValueEqualsTo (_ value: String){
        let nameTextFieldValue = app.textFields[Identifiers.nameTextField].value as! String
        
        XCTAssertTrue(nameTextFieldValue == value, "Name text field is not \(value)")
    }
    
    func nameErrorLabelValueEqualsTo (_ value: String){
        let nameErrorText = app.staticTexts[Identifiers.nameErrorLabel].label
        
        XCTAssertTrue(nameErrorText == value)
    }
    
    // Age text field
    
    func ageTextFieldValueEqualsTo (_ value: Int){
        let text = app.textFields[Identifiers.ageTextField].value as! String
        let age = Int(text)
        
        XCTAssertTrue(age == value, "Value of age is \(age ?? 0), not \(value) as expected.")
    }
    
    func ageErrorLabelValueEqualsTo (_ value: String){
        let ageErrorText = app.staticTexts[Identifiers.ageErrorLabel].label
        
        XCTAssertTrue(ageErrorText == value)
    }
    
    func ageIncreaseButtonIsEnabled(){
        XCTAssertTrue(app.buttons[Identifiers.ageIncrement].isEnabled, "Age increase button is not enabled")
    }
    
    func ageIncreaseButtonIsNotEnabled(){
        XCTAssertFalse(app.buttons[Identifiers.ageIncrement].isEnabled, "Age increase button is enabled")
    }
    
    func ageDecreaseButtonIsEnabled(){
        XCTAssertTrue(app.buttons[Identifiers.ageDecrement].isEnabled, "Age increase button is not enabled")
    }
    
    func ageDecreaseButtonIsNotEnabled(){
        XCTAssertFalse(app.buttons[Identifiers.ageDecrement].isEnabled, "Age increase button is enabled")
    }
    
    // Gender text field
    
    func genderTextFiledValueEqualsTo (_ value: String){
        let genderTextFieldValue = app.textFields[Identifiers.genderTextField].value as! String
        
        XCTAssertTrue(genderTextFieldValue == value, "Name text field is not \(value)")
    }
    
    func genderTextFieldPalaceholderEqualsTo (_ value: String){
        XCTAssertTrue(app.textFields[Identifiers.genderTextField].placeholderValue == value)
    }
    
    func genderErrorLabelValueEqualsTo (_ value: String){
        let genderErrorText = app.staticTexts[Identifiers.genderErrorLabel].label
        
        XCTAssertTrue(genderErrorText == value)
    }
    
    // Navigation bar
    
    func navigationBarHasTitle (_ title: String){
        let navigationBarTitle = app.navigationBars[Identifiers.navigationBar].staticTexts[Identifiers.navigationBar].label
        
        XCTAssertTrue(navigationBarTitle == title)
    }
    
    // Alert
    
    func alertHasProperTiltle (){
        let alertTile = "Validation error"
        
        XCTAssertTrue(app.alerts[Identifiers.saveErrorAlert].staticTexts[alertTile].exists, "Alert error title is not vaild")
    }
    
    func alertHasProperMessage (){
        let alertMessage = "The form has errors. Correct the data to save."
        
        XCTAssertTrue(app.alerts[Identifiers.saveErrorAlert].staticTexts[alertMessage].exists, "Alert error message is not valid")
    }
    
    func alertHasOkButton (){
        XCTAssertTrue(app.alerts[Identifiers.saveErrorAlert].buttons[Identifiers.alertOkButton].exists, "Alert OK button does not exist")
    }
}

