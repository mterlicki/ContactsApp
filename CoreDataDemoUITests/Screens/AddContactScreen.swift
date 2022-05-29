//
//  AddPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest
import CoreDataDemo

struct AddContactScreen: BaseScreen {
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
        tapNavigationBarButton(Identifiers.navigationBar, Identifiers.cancelButton)
        return ContactListScreen(app: app)
    }
    
    func tapSave() -> ContactListScreen{
        tapNavigationBarButton(Identifiers.navigationBar, Identifiers.saveButton)
        return ContactListScreen(app: app)
    }
    
    func tapSave() -> Self{
        tapNavigationBarButton(Identifiers.navigationBar, Identifiers.saveButton)
        return self
    }
    
    //Name text field
    func tapNameTextField() -> Self{
        tapTextField(Identifiers.nameTextField)
        return self
    }
    
    func typeName(_ name: String) -> Self{
        typeText(Identifiers.nameTextField, name)
        return self
    }
    
    func clearName() -> Self{
        clearTextField(Identifiers.nameTextField)
        return self
    }
    
    // Age text field
    func tapAgeTextField() -> Self{
        tapTextField(Identifiers.ageTextField)
        return self
    }
    
    func typeAge(_ age: String) -> Self{
        typeText(Identifiers.ageTextField, age)
        return self
    }
    
    func tapIncreaseAge() -> Self{
        tapButton(Identifiers.ageIncrement)
        return self
    }
    
    func tapIncreaseAgeWith(_ number: Int) -> Self{
        app.buttons[Identifiers.ageIncrement].tap(withNumberOfTaps: number, numberOfTouches: 1)

        return self
    }
    
    func tapDecreaseAge() -> Self{
        tapButton(Identifiers.ageDecrement)
        return self
    }
    
    func tapDecreaseAgeWith(_ number: Int) -> Self{
        app.buttons[Identifiers.ageDecrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        return self
    }
    
    func clearAge() -> Self{
        clearTextField(Identifiers.ageTextField)
        return self
    }
    
    //Gender text field
    func tapGenderTextField() -> Self{
        tapTextField(Identifiers.genderTextField)
        return self
    }
    
    func typeGender(_ gender: String) -> Self{
        typeText(Identifiers.genderTextField, gender)
        return self
    }
    
    func clearGender() -> Self{
        clearTextField(Identifiers.genderTextField)
        return self
    }
    
    //Alert
    func tapAlertOkButton() -> AddContactScreen{
        alertButtonTap(Identifiers.saveErrorAlert, Identifiers.alertOkButton)
        return AddContactScreen(app: app)
    }
    
    // Add contact
    
    func fillFormAndSave (_ name: String, _ age: String, _ gender: String) -> ContactListScreen {
        typeText(Identifiers.nameTextField, name)
        tapTextField(Identifiers.ageTextField)
        clearTextField(Identifiers.ageTextField)
        typeText(Identifiers.ageTextField, age)
        typeText(Identifiers.genderTextField, gender)
        tapButton(Identifiers.saveButton)
        return ContactListScreen(app: app)
        
    }
    
    // MARK: Assertions
    
    func addPersonScreenIsLoaded(){
        buttonExists(Identifiers.saveButton)
        buttonExists(Identifiers.cancelButton)
        labelExists(Identifiers.nameLabel)
        labelExists(Identifiers.nameErrorLabel)
        textFieldExists(Identifiers.nameTextField)
        labelExists(Identifiers.ageLabel)
        labelExists(Identifiers.ageErrorLabel)
        textFieldExists(Identifiers.ageTextField)
        labelExists(Identifiers.genderLabel)
        labelExists(Identifiers.genderErrorLabel)
        textFieldExists(Identifiers.genderTextField)
    }
    
    // Name text feield
    
    func nameTextFieldPalaceholderEqualsTo (_ value: String){
        textFieldPalaceholderEqualsTo(Identifiers.nameTextField, value)
    }
    
    func nameTextFiledValueEqualsTo (_ value: String){
        textFieldValueEqualsTo(Identifiers.nameTextField, value)
    }
    
    func nameErrorLabelValueEqualsTo (_ value: String){
        labelHasValue(Identifiers.nameErrorLabel, value)
    }
    
    // Age text field
    
    func ageTextFieldValueEqualsTo (_ value: String){
        textFieldValueEqualsTo(Identifiers.ageTextField, value)
    }
    
    func ageErrorLabelValueEqualsTo (_ value: String){
        labelHasValue(Identifiers.ageErrorLabel, value)
    }
    
    func ageIncreaseButtonIsEnabled(){
        buttonIsEnabled(Identifiers.ageIncrement)
    }
    
    func ageIncreaseButtonIsNotEnabled(){
        ButtonIsDisabled(Identifiers.ageIncrement)
    }
    
    func ageDecreaseButtonIsEnabled(){
        buttonIsEnabled(Identifiers.ageDecrement)
    }
    
    func ageDecreaseButtonIsNotEnabled(){
        ButtonIsDisabled(Identifiers.ageDecrement)
    }
    
    // Gender text field
    
    func genderTextFiledValueEqualsTo (_ value: String){
        textFieldValueEqualsTo(Identifiers.genderTextField, value)
    }
    
    func genderTextFieldPalaceholderEqualsTo (_ value: String){
        textFieldPalaceholderEqualsTo(Identifiers.genderTextField, value)
    }
    
    func genderErrorLabelValueEqualsTo (_ value: String){
        labelHasValue(Identifiers.genderErrorLabel, value)
    }
    
    // Navigation bar
    
    func navigationBarHasTitle (_ title: String){
        navigationBarHasTitle(Identifiers.navigationBar, title)
    }
    
    // Alert
    
    func alertHasProperTiltle (){
        let alertTile = "Validation error"
        
        alertHasText(Identifiers.saveErrorAlert, alertTile)
    }
    
    func alertHasProperMessage (){
        let alertMessage = "The form has errors. Correct the data to save."
        
        alertHasText(Identifiers.saveErrorAlert, alertMessage)
    }
    
    func alertHasOkButton (){
        buttonExists(Identifiers.alertOkButton)
    }
}

