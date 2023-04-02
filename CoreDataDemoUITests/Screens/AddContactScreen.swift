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
    @discardableResult
    func tapCancel() -> Self {
        tapNavigationBarButton(Identifiers.navigationBar, Identifiers.cancelButton)
        return self
    }

    @discardableResult
    func tapSave() -> Self {
        tapNavigationBarButton(Identifiers.navigationBar, Identifiers.saveButton)
        return self
    }

    // Name text field
    @discardableResult
    func tapNameTextField() -> Self {
        tapTextField(Identifiers.nameTextField)
        return self
    }

    @discardableResult
    func typeName(_ name: String) -> Self {
        typeText(Identifiers.nameTextField, name)
        return self
    }

    @discardableResult
    func clearName() -> Self {
        clearTextField(Identifiers.nameTextField)
        return self
    }

    // Age text field
    @discardableResult
    func tapAgeTextField() -> Self {
        tapTextField(Identifiers.ageTextField)
        return self
    }

    @discardableResult
    func typeAge(_ age: String) -> Self {
        typeText(Identifiers.ageTextField, age)
        return self
    }

    @discardableResult
    func tapIncreaseAge() -> Self {
        tapButton(Identifiers.ageIncrement)
        return self
    }

    @discardableResult
    func tapIncreaseAgeWith(_ number: Int) -> Self {
        app.buttons[Identifiers.ageIncrement].tap(withNumberOfTaps: number, numberOfTouches: 1)

        return self
    }

    @discardableResult
    func tapDecreaseAge() -> Self {
        tapButton(Identifiers.ageDecrement)
        return self
    }

    @discardableResult
    func tapDecreaseAgeWith(_ number: Int) -> Self {
        app.buttons[Identifiers.ageDecrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        return self
    }

    @discardableResult
    func clearAge() -> Self {
        clearTextField(Identifiers.ageTextField)
        return self
    }

    @discardableResult
    // Gender text field
    func tapGenderTextField() -> Self {
        tapTextField(Identifiers.genderTextField)
        return self
    }

    @discardableResult
    func typeGender(_ gender: String) -> Self {
        typeText(Identifiers.genderTextField, gender)
        return self
    }

    @discardableResult
    func clearGender() -> Self {
        clearTextField(Identifiers.genderTextField)
        return self
    }

    // Alert
    @discardableResult
    func tapAlertOkButton() -> AddContactScreen {
        alertButtonTap(Identifiers.saveErrorAlert, Identifiers.alertOkButton)
        return AddContactScreen(app: app)
    }

    // Add contact
    @discardableResult
    func fillFormAndSave (_ name: String, _ age: String, _ gender: String) -> Self {
        typeText(Identifiers.nameTextField, name)
        tapTextField(Identifiers.ageTextField)
        clearTextField(Identifiers.ageTextField)
        typeText(Identifiers.ageTextField, age)
        typeText(Identifiers.genderTextField, gender)
        tapButton(Identifiers.saveButton)
        return self

    }

    // MARK: Assertions

    @discardableResult
    func addPersonScreenIsLoaded() -> Self {
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
        return self
    }

    // Name text feield

    @discardableResult
    func nameTextFieldPalaceholderEqualsTo (_ value: String) -> Self {
        textFieldPalaceholderEqualsTo(Identifiers.nameTextField, value)
        return self
    }

    @discardableResult
    func nameTextFiledValueEqualsTo (_ value: String) -> Self {
        textFieldValueEqualsTo(Identifiers.nameTextField, value)
        return self
    }

    @discardableResult
    func nameErrorLabelValueEqualsTo (_ value: String) -> Self {
        labelHasValue(Identifiers.nameErrorLabel, value)
        return self
    }

    // Age text field

    @discardableResult
    func ageTextFieldValueEqualsTo (_ value: String) -> Self {
        textFieldValueEqualsTo(Identifiers.ageTextField, value)
        return self
    }

    @discardableResult
    func ageErrorLabelValueEqualsTo (_ value: String) -> Self {
        labelHasValue(Identifiers.ageErrorLabel, value)
        return self
    }

    @discardableResult
    func ageIncreaseButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.ageIncrement)
        return self
    }

    @discardableResult
    func ageIncreaseButtonIsNotEnabled() -> Self {
        buttonIsDisabled(Identifiers.ageIncrement)
        return self
    }

    @discardableResult
    func ageDecreaseButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.ageDecrement)
        return self
    }

    @discardableResult
    func ageDecreaseButtonIsNotEnabled() -> Self {
        buttonIsDisabled(Identifiers.ageDecrement)
        return self
    }

    // Gender text field

    @discardableResult
    func genderTextFiledValueEqualsTo (_ value: String) -> Self {
        textFieldValueEqualsTo(Identifiers.genderTextField, value)
        return self
    }

    @discardableResult
    func genderTextFieldPalaceholderEqualsTo (_ value: String) -> Self {
        textFieldPalaceholderEqualsTo(Identifiers.genderTextField, value)
        return self
    }

    @discardableResult
    func genderErrorLabelValueEqualsTo (_ value: String) -> Self {
        labelHasValue(Identifiers.genderErrorLabel, value)
        return self
    }

    // Navigation bar

    @discardableResult
    func navigationBarHasTitle (_ title: String) -> Self {
        navigationBarHasTitle(Identifiers.navigationBar, title)
        return self
    }

    // Alert

    @discardableResult
    func alertHasProperTiltle () -> Self {
        let alertTile = "Validation error"

        alertHasText(Identifiers.saveErrorAlert, alertTile)
        return self
    }

    @discardableResult
    func alertHasProperMessage () -> Self {
        let alertMessage = "The form has errors. Correct the data to save."

        alertHasText(Identifiers.saveErrorAlert, alertMessage)
        return self
    }

    @discardableResult
    func alertHasOkButton () -> Self {
        buttonExists(Identifiers.alertOkButton)
        return self
    }
}
