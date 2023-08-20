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

    private struct Identifiers {
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
        XCTContext.runActivity(named: "Tap Cancel button") { _ in
            tapNavigationBarButton(Identifiers.navigationBar, Identifiers.cancelButton)
        }
        return self
    }

    @discardableResult
    func tapSave() -> Self {
        XCTContext.runActivity(named: "Tap Save button") { _ in
            tapNavigationBarButton(Identifiers.navigationBar, Identifiers.saveButton)
        }
        return self
    }

    // Name text field
    @discardableResult
    func tapNameTextField() -> Self {
        XCTContext.runActivity(named: "Tap Name text field") { _ in
            tapTextField(Identifiers.nameTextField)
        }
        return self
    }

    @discardableResult
    func typeName(_ name: String) -> Self {
        XCTContext.runActivity(named: "Tap Name text field and type: \(name)") { _ in
            typeText(Identifiers.nameTextField, name)
        }
        return self
    }

    @discardableResult
    func clearName() -> Self {
        XCTContext.runActivity(named: "Clear Name text field") { _ in
            clearTextField(Identifiers.nameTextField)
        }
        return self
    }

    // Age text field
    @discardableResult
    func tapAgeTextField() -> Self {
        XCTContext.runActivity(named: "Tap Age text field") { _ in
            tapTextField(Identifiers.ageTextField)
        }
        return self
    }

    @discardableResult
    func typeAge(_ age: String) -> Self {
        XCTContext.runActivity(named: "Tap Age text field and type age: \(age)") { _ in
            typeText(Identifiers.ageTextField, age)
        }
        return self
    }

    @discardableResult
    func tapIncreaseAge() -> Self {
        XCTContext.runActivity(named: "Tap increase age button") { _ in
            tapButton(Identifiers.ageIncrement)
        }
        return self
    }

    @discardableResult
    func tapIncreaseAgeWith(_ number: Int) -> Self {
        XCTContext.runActivity(named: "Tap increase age age button \(number) times") { _ in
            app.buttons[Identifiers.ageIncrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        }
        return self
    }

    @discardableResult
    func tapDecreaseAge() -> Self {
        XCTContext.runActivity(named: "Tap decrease age button") { _ in
            tapButton(Identifiers.ageDecrement)
        }
        return self
    }

    @discardableResult
    func tapDecreaseAgeWith(_ number: Int) -> Self {
        XCTContext.runActivity(named: "Tap decrease age button \(number) times") { _ in
            app.buttons[Identifiers.ageDecrement].tap(withNumberOfTaps: number, numberOfTouches: 1)
        }
        return self
    }

    @discardableResult
    func clearAge() -> Self {
        XCTContext.runActivity(named: "Clear age text field") { _ in
            clearTextField(Identifiers.ageTextField)
        }
        return self
    }

    @discardableResult
    // Gender text field
    func tapGenderTextField() -> Self {
        XCTContext.runActivity(named: "Tap Gender text field") { _ in
            tapTextField(Identifiers.genderTextField)
        }
        return self
    }

    @discardableResult
    func typeGender(_ gender: String) -> Self {
        XCTContext.runActivity(named: "Tap Gender text field and type: \(gender)") { _ in
            typeText(Identifiers.genderTextField, gender)
        }
        return self
    }

    @discardableResult
    func clearGender() -> Self {
        XCTContext.runActivity(named: "Clear gender text field") { _ in
            clearTextField(Identifiers.genderTextField)
        }
        return self
    }

    // Alert
    @discardableResult
    func tapAlertOkButton() -> Self {
        XCTContext.runActivity(named: "Tap Ok button in save alert popover") { _ in
            alertButtonTap(Identifiers.saveErrorAlert, Identifiers.alertOkButton)
        }
        return self
    }

    // Add contact
    @discardableResult
    func fillFormAndSave (_ name: String, _ age: String, _ gender: String) -> Self {
        XCTContext.runActivity(named: "Fill form with name: \(name), age: \(age), gender: \(gender) and tap Save button") { _ in
            typeText(Identifiers.nameTextField, name)
            tapTextField(Identifiers.ageTextField)
            clearTextField(Identifiers.ageTextField)
            typeText(Identifiers.ageTextField, age)
            typeText(Identifiers.genderTextField, gender)
            tapButton(Identifiers.saveButton)
        }
        return self

    }

    // MARK: Assertions

    @discardableResult
    func addPersonScreenIsLoaded() -> Self {
        XCTContext.runActivity(named: "Verify if add contact form is in initial state") { _ in
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
        return self
    }

    // Name text feield

    @discardableResult
    func nameTextFieldPalaceholderEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Name text field placeholder has value: \(value)") { _ in
            textFieldPalaceholderEqualsTo(Identifiers.nameTextField, value)
        }
        return self
    }

    @discardableResult
    func nameTextFiledValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Name text field value is: \(value)") { _ in
            textFieldValueEqualsTo(Identifiers.nameTextField, value)
        }
        return self
    }

    @discardableResult
    func nameErrorLabelValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Name error label has value: \(value)") { _ in
            labelHasValue(Identifiers.nameErrorLabel, value)
        }
        return self
    }

    // Age text field

    @discardableResult
    func ageTextFieldValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Age text field has value: \(value)") { _ in
            textFieldValueEqualsTo(Identifiers.ageTextField, value)
        }
        return self
    }

    @discardableResult
    func ageErrorLabelValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Age error label has value: \(value)") { _ in
            labelHasValue(Identifiers.ageErrorLabel, value)
        }
        return self
    }

    @discardableResult
    func ageIncreaseButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Age increase button is hittable") { _ in
            buttonIsEnabled(Identifiers.ageIncrement)
        }
        return self
    }

    @discardableResult
    func ageIncreaseButtonIsNotEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Age increase button is not hittable") { _ in
            buttonIsDisabled(Identifiers.ageIncrement)
        }
        return self
    }

    @discardableResult
    func ageDecreaseButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Age decrease button is hittable") { _ in
            buttonIsEnabled(Identifiers.ageDecrement)
        }
        return self
    }

    @discardableResult
    func ageDecreaseButtonIsNotEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Age decrease button is not hittable") { _ in
            buttonIsDisabled(Identifiers.ageDecrement)
        }
        return self
    }

    // Gender text field

    @discardableResult
    func genderTextFieldValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Gender text field has value: \(value)") { _ in
            textFieldValueEqualsTo(Identifiers.genderTextField, value)
        }
        return self
    }

    @discardableResult
    func genderTextFieldPalaceholderEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Gender text field placeholder has value: \(value)") { _ in
            textFieldPalaceholderEqualsTo(Identifiers.genderTextField, value)
        }
        return self
    }

    @discardableResult
    func genderErrorLabelValueEqualsTo (_ value: String) -> Self {
        XCTContext.runActivity(named: "Verify if Gender error label has value: \(value)") { _ in
            labelHasValue(Identifiers.genderErrorLabel, value)
        }
        return self
    }

    // Navigation bar

    @discardableResult
    func navigationBarHasTitle (_ title: String) -> Self {
        XCTContext.runActivity(named: "Verify if navigation bar has title: \(title)") { _ in
            navigationBarHasTitle(Identifiers.navigationBar, title)
        }
        return self
    }

    // Alert

    @discardableResult
    func alertHasProperTiltle () -> Self {
        let alertTile = "Validation error"
        
        XCTContext.runActivity(named: "Verify if alert popover has title: \(alertTile)") { _ in
            alertHasText(Identifiers.saveErrorAlert, alertTile)
        }
        return self
    }

    @discardableResult
    func alertHasProperMessage () -> Self {
        let alertMessage = "The form has errors. Correct the data to save."

        XCTContext.runActivity(named: "Verify if alert popover has message: \(alertMessage)") { _ in
            alertHasText(Identifiers.saveErrorAlert, alertMessage)
        }
        return self
    }

    @discardableResult
    func alertHasOkButton () -> Self {
        XCTContext.runActivity(named: "Verify if alert popover has Ok button") { _ in
            buttonExists(Identifiers.alertOkButton)
        }
        return self
    }
}
