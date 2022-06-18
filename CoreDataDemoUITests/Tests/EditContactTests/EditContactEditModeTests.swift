//
//  EditContactEditModeTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 18/06/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class EditContactEditModeTests: BaseTest {

    let contactName = "John"
    let age = "22"
    let gender = "men"
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave(contactName, age, gender)
    }
    
    func testAfterHittingEditButtonNameEditButtonsIsActive() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .editNameButtonIsEnabled()
    }
    
    func testAfterHittingEditButtonAgeEditButtonsIsActive() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .editAgeButtonIsEnabled()
    }
    
    func testAfterHittingEditButtonGenderEditButtonsIsActive() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .editGenderButtonIsEnabled()
    }
    
    func testAfterHittingNameEditButtonsShowsEditAlertWithTitle() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .verifyAlertHasText("Edit name")
    }
    
    func testAfterHittingAgeEditButtonsShowsEditAlertWithTitle() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditAge()
            .verifyAlertHasText("Edit age")
    }
    
    func testAfterHittingGenderEditButtonsShowsEditAlertWithTitle() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditGender()
            .verifyAlertHasText("Edit gender")
    }
    
    func testAfterHittingDoneNameEditButtonIsDisabled() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapDone()
            .editNameButtonIsDisabled()
    }
        
    func testAfterHittingDoneAgeEditButtonIsDisabled() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapDone()
            .editAgeButtonIsDisabled()
    }
    
    func testAfterHittingDoneGenderEditButtonIsDisabled() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapDone()
            .editGenderButtonIsDisabled()
    }
    
    func testAlertHasFiledNameInTextField() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .verifyAlertTextFieldHasText(contactName)
    }
    
    func testAlertHasFiledAgeInTextField() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditAge()
            .verifyAlertTextFieldHasText(age)
    }
    
    func testAlertHasFiledGenderInTextField() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditGender()
            .verifyAlertTextFieldHasText(gender)
    }
    
    func testSubmitingChangesInNameChangesLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .alertClearText()
            .alertTypeText("Mary")
            .alertTapSubmit()
            .verifyContactNameLabelHasValue("Mary")
    }
    
    func testCancelingChangesInNameDoesNotChangeLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .alertClearText()
            .alertTypeText("Mary")
            .alertTapCancel()
            .verifyContactNameLabelHasValue(contactName)
    }
    
    func testSubmitingChangesInAgeChangesLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditAge()
            .alertClearText()
            .alertTypeText("34")
            .alertTapSubmit()
            .verifyContactAgeLabelHasValue("34")
    }
    
    func testCancelingChangesInAgeDoesNotChangeLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .alertClearText()
            .alertTypeText("34")
            .alertTapCancel()
            .verifyContactAgeLabelHasValue(age)
    }
    
    func testSubmitingChangesInGenderChangesLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditGender()
            .alertClearText()
            .alertTypeText("woman")
            .alertTapSubmit()
            .verifyContactGenderLabelHasValue("woman")
    }
    
    func testCancelingChangesInGenderDoesNotChangeLabelValue() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditGender()
            .alertClearText()
            .alertTypeText("woman")
            .alertTapCancel()
            .verifyContactGenderLabelHasValue(gender)
    }
    
    func testAfterTapingDoneButtonNewNameIsVisibleOnList() throws {
        ContactListScreen(app: app)
            .selectContact(contactName)
            .tapEdit()
            .tapEditName()
            .alertClearText()
            .alertTypeText("Paul")
            .alertTapSubmit()
            .tapDone()
            .tapBackButton()
            .verifyContactWithNameExists("Paul")
    }
}
