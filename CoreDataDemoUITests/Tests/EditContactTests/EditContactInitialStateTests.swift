//
//  EditContactInitialStateTests.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 26/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

class EditContactInitialStateTests: BaseTest {

    func test() throws{
        ContactListScreen(app: app)
            .tapAddContact()
            .fillFormAndSave("John", "22", "men")
            .selectContact("John")
            .tapEdit()
            .tapDone()
            .tapEdit()
            .tapEditAge()
            .alertClearText()
            .alertTypeText("34")
            .alertTapSubmit()
    }
}
