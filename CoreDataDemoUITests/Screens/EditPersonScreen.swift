//
//  EditPersonScreen.swift
//  CoreDataDemoUITests
//
//  Created by Michal Terlicki on 02/04/2022.
//

import XCTest

struct EditPersonScreen: Screen {
    var app: XCUIApplication
    
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
    }
    
}
