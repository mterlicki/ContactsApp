//
//  EditPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

struct EditPersonScreen: Screen {
    var app: XCUIApplication
    
    // MARK: Identifiers
    
    private enum Identifiers{
        static let nameLabel = "nameLabel"
        static let contactNameLabel = "contactNameLabel"
        static let nameEditButton = "nameEditButton"
        
        static let ageLabel = "ageLabel"
        static let contactAgeLabel = "contactAgeLabel"
        static let ageEditButton = "ageEditButton"
        
        static let genderLabel = "genderLabel"
        static let contactGenderLabel = "contactGenderLabel"
        static let genderEditButton = "genderEditButton"
        
        static let editButton = "editContactButton"
        static let doneButton = "doneButton"
        static let backButton = "Contacts"
        
        static let editAlert = "editAlert"
        static let alertTextField = "alertTextField"
        static let alertSubmitButton = "alertSubmitButton"
        static let alertCancelButton = "alertCancelButton"
    }
    
    // MARK: Handlers
    
    // Naviagation bar
    
    func tapBackButton() -> ContactListScreen{
        buttonTap(Identifiers.backButton)
        return ContactListScreen(app: app)
    }
    
    func tapEdit() -> Self{
        buttonTap(Identifiers.editButton)
        return self
    }
    
    func tapDone() -> Self{
        buttonTap(Identifiers.doneButton)
        return self
    }
    
    // Edit buttons
    
    func tapEditName() -> Self{
        buttonTap(Identifiers.nameEditButton)
        return self
    }
    
    func tapEditAge() -> Self{
        buttonTap(Identifiers.ageEditButton)
        return self
    }
    
    func tapEditGender() -> Self{
        buttonTap(Identifiers.genderEditButton)
        return self
    }
    
    // Alert
    
    func alertTapCancel() -> Self{
        alertButtonTap(Identifiers.editAlert, Identifiers.alertCancelButton)
        return self
    }
    
    func alertTapSubmit() -> Self{
        alertButtonTap(Identifiers.editAlert, Identifiers.alertSubmitButton)
        return self
    }
    
    func alertClearText() -> Self{
        clearAlertTextField(Identifiers.editAlert, Identifiers.alertTextField)
        return self
    }
    
    func alertTypeText(_ text:String) -> Self{
        alertTextFieldTypeText(Identifiers.editAlert, Identifiers.alertTextField, text)
        return self
    }
    
    // MARK: Assertions
    
    // Navigation bar
    
    func doneButtonExists() {
        buttonExists(Identifiers.doneButton)
    }
    
    func doneButtonIsEnabled() {
        buttonIsEnabled(Identifiers.doneButton)
    }
    
    func editButtonExists() {
        buttonExists(Identifiers.editButton )
    }
    
    func editButtonIsEnabled() {
        buttonIsEnabled(Identifiers.editButton)
    }
    
    // Edit buttons
    // Name
    
    func editNameButtonIsEnabled() {
        buttonIsEnabled(Identifiers.nameEditButton)
    }
    
    func editNameButtonIsDisabled() {
        ButtonIsDisabled(Identifiers.nameEditButton)
    }
    
    func editNameButtonExists() {
        buttonExists(Identifiers.nameEditButton)
    }
    
    // Age
    
    func editAgeButtonIsEnabled() {
        buttonIsEnabled(Identifiers.ageEditButton)
    }
    
    func editAgeButtonIsDisabled() {
        ButtonIsDisabled(Identifiers.ageEditButton)
    }
    
    func editAgeButtonExists() {
        buttonExists(Identifiers.ageEditButton)
    }
    
    // Gender
    
    func editGenderButtonIsEnabled() {
        buttonIsEnabled(Identifiers.genderEditButton)
    }
    
    func editGenderButtonIsDisabled() {
        ButtonIsDisabled(Identifiers.genderEditButton)
    }
    
    func editGenderButtonExists() {
        buttonExists(Identifiers.genderEditButton)
    }
    
    // Name label
    
    func verifyNameLabelHasValue(_ name:String) {
        labelHasValue(Identifiers.contactNameLabel, name)
    }
    
    // Age label
    
    func verifyAgeLabelHasValue(_ age:String) {
        labelHasValue(Identifiers.contactAgeLabel, age)
    }
    
    // Gender label
    
    func verifyGenderLabelHasValue(_ gender:String) {
        labelHasValue(Identifiers.contactGenderLabel, gender)
    }
    
    
    // MARK: Helpers
    
    // Labels
    
    private func labelHasValue (_ identifier:String, _ value:String) {
        let labelValue = app.staticTexts[identifier].description
        XCTAssertTrue(labelValue == value, "Value is \(labelValue) not \(value) as expected")
    }
    
    // Buttons
    
    private func buttonTap(_ identifier:String){
        app.buttons[identifier].tap()
    }
    
    private func buttonExists(_ identifier:String){
        XCTAssertTrue(app.buttons[identifier].exists, "\(identifier) button does not exist")
    }
    
    private func buttonIsEnabled(_ identifier:String) {
        XCTAssertTrue(app.buttons[identifier].isEnabled, "\(identifier) button is disabled")
    }
    
    func ButtonIsDisabled(_ identifier:String) {
        XCTAssertFalse(app.buttons[identifier].isEnabled, "\(identifier) button is enabled")
    }
    
    // Alerts
    
    private func clearAlertTextField(_ alertIdentifier:String, _ textFieldIdentifier:String) {
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].tap()
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].clearText()
    }
    
    private func alertButtonTap(_ alertIdentifier:String, _ buttonIdentifier:String) {
        app.alerts[alertIdentifier].buttons[buttonIdentifier].tap()
    }
    
    private func alertTextFieldTypeText(_ alertIdentifier:String, _ textFieldIdentifier:String, _ text:String) {
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].tap()
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].typeText(text)
    }
}
