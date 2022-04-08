//
//  AddPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest

struct AddPersonScreen: Screen {
    var app: XCUIApplication
    
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
    
    
}

