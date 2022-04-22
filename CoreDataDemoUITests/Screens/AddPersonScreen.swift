//
//  AddPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest
import CoreDataDemo

struct AddPersonScreen: Screen {
    var app: XCUIApplication
    
    // MARK: Identifiers
    
    private enum Identifiers {
        static let nameLabel = "nameLabel"
        static let nameTextField = "nameTextField"
        static let nameErrorLabel = "nameErrorLabel"
        
        static let ageLabel = "ageLabel"
        static let ageTextField = "nameTextField"
        static let ageStepper = "ageStepper"
        static let ageErrorLabel = "ageErrorLabel"
        
        static let genderLabel = "genderLabel"
        static let genderTextField = "genderTextField"
        static let genderErrorLabel = "genderErrorLabel"
        
        static let cancelButton = "cancelButton"
        static let saveButton = "saveButton"
    }
    
    
    // MARK: Handlers
    func typeName(_ name: String) -> Self{
        app.textFields[Identifiers.nameTextField].tap()
        app.textFields[Identifiers.nameTextField].typeText(name)
        return self
    }
    
    func typeAge(_ age: String) -> Self{
        app.textFields[Identifiers.ageTextField].tap()
        app.textFields[Identifiers.ageTextField].typeText(age)
        return self
    }
    
    func increaseAge() -> Self{
        app.steppers[Identifiers.ageStepper].keys["+"].tap()
        return self
    }
    
    func decreaseAge() -> Self{
        app.steppers[Identifiers.ageStepper].keys["-"].tap()
        return self
    }
    
    func typeGender(_ gender: String) -> Self{
        app.textFields[Identifiers.genderTextField].tap()
        app.textFields[Identifiers.genderTextField].typeText(gender)
        return self
    }
    
    // MARK: Assertions
    
    func nameIsNotEmpty(){
        //XCTAssert(app.textFields[Identifiers.nameTextField].value != "", "Name is not empty")
        
    }
}

