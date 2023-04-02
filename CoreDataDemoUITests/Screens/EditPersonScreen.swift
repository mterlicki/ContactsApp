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

    private enum Identifiers {
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

    @discardableResult
    func tapBackButton() -> Self {
        tapButton(Identifiers.backButton)
        return self
    }

    @discardableResult
    func tapEdit() -> Self {
        tapButton(Identifiers.editButton)
        return self
    }

    @discardableResult
    func tapDone() -> Self {
        tapButton(Identifiers.doneButton)
        return self
    }

    // Edit buttons

    @discardableResult
    func tapEditName() -> Self {
        tapButton(Identifiers.nameEditButton)
        return self
    }

    @discardableResult
    func tapEditAge() -> Self {
        tapButton(Identifiers.ageEditButton)
        return self
    }

    @discardableResult
    func tapEditGender() -> Self {
        tapButton(Identifiers.genderEditButton)
        return self
    }

    // Alert

    @discardableResult
    func alertTapCancel() -> Self {
        alertButtonTap(Identifiers.editAlert, Identifiers.alertCancelButton)
        return self
    }

    @discardableResult
    func alertTapSubmit() -> Self {
        alertButtonTap(Identifiers.editAlert, Identifiers.alertSubmitButton)
        return self
    }

    @discardableResult
    func alertClearText() -> Self {
        clearAlertTextField(Identifiers.editAlert, Identifiers.alertTextField)
        return self
    }

    @discardableResult
    func alertTypeText(_ text: String) -> Self {
        alertTextFieldTypeText(Identifiers.editAlert, Identifiers.alertTextField, text)
        return self
    }

    // MARK: Assertions

    @discardableResult
    func editContactHasInitialState() -> Self {
        editButtonExists()
        editNameButtonExists()
        editNameButtonIsDisabled()
        editAgeButtonExists()
        editAgeButtonIsDisabled()
        editGenderButtonExists()
        editGenderButtonIsDisabled()
        return self
    }

    @discardableResult
    func editContactHasContactData(_ name: String, _ age: String, _ gender: String) -> Self {
        verifyContactNameLabelHasValue(name)
        verifyContactAgeLabelHasValue(age)
        verifyContactGenderLabelHasValue(gender)
        return self
    }

    // Navigation bar

    @discardableResult
    func doneButtonExists() -> Self {
        buttonExists(Identifiers.doneButton)
        return self
    }

    @discardableResult
    func doneButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.doneButton)
        return self
    }

    @discardableResult
    func editButtonExists() -> Self {
        buttonExists(Identifiers.editButton)
        return self
    }

    @discardableResult
    func editButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.editButton)
        return self
    }

    // Edit buttons
    // Name

    @discardableResult
    func editNameButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.nameEditButton)
        return self
    }

    @discardableResult
    func editNameButtonIsDisabled() -> Self {
        buttonIsDisabled(Identifiers.nameEditButton)
        return self
    }

    @discardableResult
    func editNameButtonExists() -> Self {
        buttonExists(Identifiers.nameEditButton)
        return self
    }

    // Age

    @discardableResult
    func editAgeButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.ageEditButton)
        return self
    }

    @discardableResult
    func editAgeButtonIsDisabled() -> Self {
        buttonIsDisabled(Identifiers.ageEditButton)
        return self
    }

    @discardableResult
    func editAgeButtonExists() -> Self {
        buttonExists(Identifiers.ageEditButton)
        return self
    }

    // Gender

    @discardableResult
    func editGenderButtonIsEnabled() -> Self {
        buttonIsEnabled(Identifiers.genderEditButton)
        return self
    }

    @discardableResult
    func editGenderButtonIsDisabled() -> Self {
        buttonIsDisabled(Identifiers.genderEditButton)
        return self
    }

    @discardableResult
    func editGenderButtonExists() -> Self {
        buttonExists(Identifiers.genderEditButton)
        return self
    }

    // Labels

    @discardableResult
    func verifyContactNameLabelHasValue(_ name: String) -> Self {
        labelHasValue(Identifiers.contactNameLabel, name)
        return self
    }

    @discardableResult
    func verifyContactAgeLabelHasValue(_ age: String) -> Self {
        labelHasValue(Identifiers.contactAgeLabel, age)
        return self
    }

    @discardableResult
    func verifyContactGenderLabelHasValue(_ gender: String) -> Self {
        labelHasValue(Identifiers.contactGenderLabel, gender)
        return self
    }

    // Alerts

    @discardableResult
    func verifyAlertHasText(_ text: String) -> Self {
        alertHasText(Identifiers.editAlert, text)
        return self
    }

    @discardableResult
    func verifyAlertTextFieldHasText(_ text: String) -> Self {
        alertTextFieldHasValue(Identifiers.editAlert, text)
        return self
    }
}
