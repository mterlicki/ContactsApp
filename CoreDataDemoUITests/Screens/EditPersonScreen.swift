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
        app.navigationBars.buttons[Identifiers.backButton].tap()
        return ContactListScreen(app: app)
    }
    
    func tapEdit() -> Self{
        app.navigationBars.buttons[Identifiers.editButton].tap()
        return self
    }
    
    func tapDone() -> Self{
        app.navigationBars.buttons[Identifiers.doneButton].tap()
        return self
    }
    
    // Edit buttons
    
    func tapEditName() -> Self{
        app.buttons[Identifiers.nameEditButton].tap()
        return self
    }
    
    func tapEditAge() -> Self{
        app.buttons[Identifiers.ageEditButton].tap()
        return self
    }
    
    func tapEditGender() -> Self{
        app.buttons[Identifiers.genderEditButton].tap()
        return self
    }
    
    // Alert
    
    func alertTapCancel() -> Self{
        app.alerts[Identifiers.editAlert].buttons[Identifiers.alertCancelButton].tap()
        return self
    }
    
    func alertTapSubmit() -> Self{
        app.alerts[Identifiers.editAlert].buttons[Identifiers.alertSubmitButton].tap()
        return self
    }
    
    func alertClearText() -> Self{
        app.alerts[Identifiers.editAlert].textFields[Identifiers.alertTextField].tap()
        app.alerts[Identifiers.editAlert].textFields[Identifiers.alertTextField].clearText()
        return self
    }
    
    func alertTypeText(_ text:String) -> Self{
        app.alerts[Identifiers.editAlert].textFields[Identifiers.alertTextField].tap()
        app.alerts[Identifiers.editAlert].textFields[Identifiers.alertTextField].typeText(text)
        return self
    }
    
    // MARK: Assertions

    
}
