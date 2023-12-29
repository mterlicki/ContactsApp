//
//  EditPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

struct EditPersonScreen: BaseScreen {
    var app: XCUIApplication

    // MARK: Identifiers

    private struct Identifiers {
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

    // Navigation bar

    @discardableResult
    func tapBackButton() -> Self {
        XCTContext.runActivity(named: "Tap Back button") { _ in
            tapButton(Identifiers.backButton)
        }
        return self
    }

    @discardableResult
    func tapEdit() -> Self {
        XCTContext.runActivity(named: "Tap Edit Button") { _ in
            tapButton(Identifiers.editButton)
        }
        return self
    }

    @discardableResult
    func tapDone() -> Self {
        XCTContext.runActivity(named: "Tap Done button") { _ in
            tapButton(Identifiers.doneButton)
        }
        return self
    }

    // Edit buttons

    @discardableResult
    func tapEditName() -> Self {
        XCTContext.runActivity(named: "Tap Edit Name button") { _ in
            tapButton(Identifiers.nameEditButton)
        }
        return self
    }

    @discardableResult
    func tapEditAge() -> Self {
        XCTContext.runActivity(named: "Tap Edit Age button") { _ in
            tapButton(Identifiers.ageEditButton)
        }
        return self
    }

    @discardableResult
    func tapEditGender() -> Self {
        XCTContext.runActivity(named: "Tap Edit Gender button") { _ in
            tapButton(Identifiers.genderEditButton)
        }
        return self
    }

    // Alert

    @discardableResult
    func alertTapCancel() -> Self {
        XCTContext.runActivity(named: "Tap Cancel button in alert popover") { _ in
            alertButtonTap(Identifiers.editAlert, Identifiers.alertCancelButton)
        }
        return self
    }

    @discardableResult
    func alertTapSubmit() -> Self {
        XCTContext.runActivity(named: "Tap Submit button in alert popover") { _ in
            alertButtonTap(Identifiers.editAlert, Identifiers.alertSubmitButton)
        }
        return self
    }

    @discardableResult
    func alertClearText() -> Self {
        XCTContext.runActivity(named: "Clear text field value in alert popover") { _ in
            clearAlertTextField(Identifiers.editAlert, Identifiers.alertTextField)
        }
        return self
    }

    @discardableResult
    func alertTypeText(_ text: String) -> Self {
        XCTContext.runActivity(named: "Type text: \(text) in alert text field") { _ in
            alertTextFieldTypeText(Identifiers.editAlert, Identifiers.alertTextField, text)
        }
        return self
    }

    // MARK: Assertions

    @discardableResult
    func editContactHasInitialState() -> Self {
        XCTContext.runActivity(named: "Verify if Edit contact form is in initial state") { _ in
            editButtonExists()
            editNameButtonExists()
            editNameButtonIsDisabled()
            editAgeButtonExists()
            editAgeButtonIsDisabled()
            editGenderButtonExists()
            editGenderButtonIsDisabled()
        }
        return self
    }

    @discardableResult
    func editContactHasContactData(_ name: String, _ age: String, _ gender: String) -> Self {
        XCTContext.runActivity(named: "Verify if Edit contact form is filed with contact name: \(name), age: \(age) and \(gender)") { _ in
            verifyContactNameLabelHasValue(name)
            verifyContactAgeLabelHasValue(age)
            verifyContactGenderLabelHasValue(gender)
        }
        return self
    }

    // Navigation bar

    @discardableResult
    func doneButtonExists() -> Self {
        XCTContext.runActivity(named: "Verify if Done button exist") { _ in
            buttonExists(Identifiers.doneButton)
        }
        return self
    }

    @discardableResult
    func doneButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Done button is hittable") { _ in
            buttonIsEnabled(Identifiers.doneButton)
        }
        return self
    }

    @discardableResult
    func editButtonExists() -> Self {
        XCTContext.runActivity(named: "Verify if Edit button exist") { _ in
            buttonExists(Identifiers.editButton)
        }
        return self
    }

    @discardableResult
    func editButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit button is hittable") { _ in
            buttonIsEnabled(Identifiers.editButton)
        }
        return self
    }

    // Edit buttons
    // Name

    @discardableResult
    func editNameButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Name button is hittable") { _ in
            buttonIsEnabled(Identifiers.nameEditButton)
        }
        return self
    }

    @discardableResult
    func editNameButtonIsDisabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Name button is not hittable") { _ in
            buttonIsDisabled(Identifiers.nameEditButton)
        }
        return self
    }

    @discardableResult
    func editNameButtonExists() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Name button exists") { _ in
            buttonExists(Identifiers.nameEditButton)
        }
        return self
    }

    // Age

    @discardableResult
    func editAgeButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Age button is hittable") { _ in
            buttonIsEnabled(Identifiers.ageEditButton)
        }
        return self
    }

    @discardableResult
    func editAgeButtonIsDisabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Age button is not hittable") { _ in
            buttonIsDisabled(Identifiers.ageEditButton)
        }
        return self
    }

    @discardableResult
    func editAgeButtonExists() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Age button exists") { _ in
            buttonExists(Identifiers.ageEditButton)
        }
        return self
    }

    // Gender

    @discardableResult
    func editGenderButtonIsEnabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Gender button is hittable") { _ in
            buttonIsEnabled(Identifiers.genderEditButton)
        }
        return self
    }

    @discardableResult
    func editGenderButtonIsDisabled() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Gender button is not hittable") { _ in
            buttonIsDisabled(Identifiers.genderEditButton)
        }
        return self
    }

    @discardableResult
    func editGenderButtonExists() -> Self {
        XCTContext.runActivity(named: "Verify if Edit Gender button exists") { _ in
            buttonExists(Identifiers.genderEditButton)
        }
        return self
    }

    // Labels

    @discardableResult
    func verifyContactNameLabelHasValue(_ name: String) -> Self {
        XCTContext.runActivity(named: "Verify if Contact Name label has value: \(name)") { _ in
            labelHasValue(Identifiers.contactNameLabel, name)
        }
        return self
    }

    @discardableResult
    func verifyContactAgeLabelHasValue(_ age: String) -> Self {
        XCTContext.runActivity(named: "Verify if Contact Age label has value: \(age)") { _ in
            labelHasValue(Identifiers.contactAgeLabel, age)
        }
        return self
    }

    @discardableResult
    func verifyContactGenderLabelHasValue(_ gender: String) -> Self {
        XCTContext.runActivity(named: "Verify if Contact Gender label has value: \(gender)") { _ in
            labelHasValue(Identifiers.contactGenderLabel, gender)
        }
        return self
    }

    // Alerts

    @discardableResult
    func verifyAlertHasText(_ text: String) -> Self {
        XCTContext.runActivity(named: "Verify if alert popover label has text: \(text)") { _ in
            alertHasText(Identifiers.editAlert, text)
        }
        return self
    }

    @discardableResult
    func verifyAlertTextFieldHasText(_ text: String) -> Self {
        XCTContext.runActivity(named: "Verify if alert popover text field has text: \(text)") { _ in
            alertTextFieldHasValue(Identifiers.editAlert, text)
        }
        return self
    }
}
