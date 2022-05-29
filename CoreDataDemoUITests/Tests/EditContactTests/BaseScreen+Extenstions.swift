//
//  BaseScreen+Extenstions.swift
//  CoreDataDemoUITests
//
//  Created by Michał Terlicki on 28/05/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import XCTest

extension BaseScreen{
    // MARK: Labels
    
    func labelHasValue(_ identifier: String, _ value: String) {
        let labelValue = app.staticTexts[identifier].label
        XCTAssertTrue(labelValue == value, "Value is \(labelValue) not \(value) as expected")
    }
    
    func labelExists(_ identifier:String){
        XCTAssertTrue(app.staticTexts[identifier].exists, "Label \(identifier) does not exist")
    }
    
    // MARK: Buttons
    
    func tapButton(_ identifier: String){
        app.buttons[identifier].tap()
    }
    
    func buttonExists(_ identifier: String){
        XCTAssertTrue(app.buttons[identifier].exists, "\(identifier) button does not exist")
    }
    
    func buttonIsEnabled(_ identifier: String) {
        XCTAssertTrue(app.buttons[identifier].isEnabled, "\(identifier) button is disabled")
    }
    
    func ButtonIsDisabled(_ identifier: String) {
        XCTAssertFalse(app.buttons[identifier].isEnabled, "\(identifier) button is enabled")
    }
    
    // MARK: Alerts
    
    func clearAlertTextField(_ alertIdentifier: String, _ textFieldIdentifier: String) {
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].tap()
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].clearText()
    }
    
    func alertButtonTap(_ alertIdentifier: String, _ buttonIdentifier: String) {
        app.alerts[alertIdentifier].buttons[buttonIdentifier].tap()
    }
    
    func alertTextFieldTypeText(_ alertIdentifier: String, _ textFieldIdentifier: String, _ text: String) {
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].tap()
        app.alerts[alertIdentifier].textFields[textFieldIdentifier].typeText(text)
    }
    
    func alertHasText (_ identifier: String, _ text: String){
        
        XCTAssertTrue(app.alerts[identifier].staticTexts[text].exists, "Alert text \(text) does not exists")
    }
    
    // MARK: Text field
    
    func tapTextField(_ identifier: String){
        app.textFields[identifier].tap()
    }
    
    func typeText(_ identfier: String, _ text: String){
        app.textFields[identfier].tap()
        app.textFields[identfier].typeText(text)
    }
    
    func clearTextField(_ identifier: String){
        app.textFields[identifier].clearText()
    }
    
    func textFieldExists(_ identifier: String){
        XCTAssertTrue(app.textFields[identifier].exists, "Text Field \(identifier) does not exist")
    }
    
    func textFieldPalaceholderEqualsTo (_ identifier: String, _ value: String){
        XCTAssertTrue(app.textFields[identifier].placeholderValue == value)
    }
    
    func textFieldValueEqualsTo (_ identifier: String, _ value: String){
        let nameTextFieldValue = app.textFields[identifier].value as! String
        
        XCTAssertTrue(nameTextFieldValue == value, "Text field value is not \(value)")
    }
    
    // MARK: Navigation bar
    
    func tapNavigationBarButton(_ navigationBarIdentifier: String, _ buttonIdentifier: String){
        app.navigationBars[navigationBarIdentifier].buttons[buttonIdentifier].tap()
    }
    
    func navigationBarHasTitle (_ navigationBarIdentifier: String, _ title: String){
        let navigationBarTitle = app.navigationBars[navigationBarIdentifier].staticTexts[navigationBarIdentifier].label
        
        XCTAssertTrue(navigationBarTitle == title)
    }
    
    // MARK: Table view
    
    func tapTableViewCell(_ tableViewIdentifier: String, _ cellIdentifier: String){
        app.tables[tableViewIdentifier].cells[cellIdentifier].tap()
    }
    
    func tapTableViewCell(_ tableViewIdentifier: String, _ cellNumber: Int){
        app.tables[tableViewIdentifier].cells.element(boundBy: cellNumber).tap()
    }
    
    func numberOfCells(_ identifier: String) -> Int {
        return app.tables[identifier].cells.count
    }
    
    func swipeLeftCell(_ tableViewIdentifier: String, _ cellNumber: Int){
        app.tables[tableViewIdentifier].cells.element(boundBy: cellNumber).swipeLeft()
    }
    
    func swipeLeftCell(_ tableViewIdentifier: String, _ cellIdentifier: String){
        app.tables[tableViewIdentifier].cells[cellIdentifier].swipeLeft()
    }
    
    func swipeRightCell(_ tableViewIdentifier: String, _ cellNumber: Int){
        app.tables[tableViewIdentifier].cells.element(boundBy: cellNumber).swipeRight()
    }
    
    func swipeRightCell(_ tableViewIdentifier: String, _ cellIdentifier: String){
        app.tables[tableViewIdentifier].cells[cellIdentifier].swipeRight()
    }
    
    func tapTableViewCellButton(_ tableViewIdentifier: String, _ cellIdentifier: String, _ buttonIdentifier: String){
        app.tables[tableViewIdentifier].cells[cellIdentifier].buttons[buttonIdentifier].tap()
    }
    
    func tapTableViewCellButton(_ tableViewIdentifier: String, _ cellNumber: Int, _ buttonIdentifier: String){
        app.tables[tableViewIdentifier].cells.element(boundBy: cellNumber).buttons[buttonIdentifier].tap()
    }
    
    func tableViewCellLabelHasValue(_ tableViewIdentifier: String, _ cellIdentifier: String, _ labelIdentifier: String, _ value: String) {
        let labelValue = app.tables[tableViewIdentifier].cells[cellIdentifier].staticTexts[labelIdentifier].label
        XCTAssertTrue(labelValue == value, "Cell label value is \(labelValue) not \(value) as expected")
    }
    
    func tableViewCellLabelHasValue(_ tableViewIdentifier: String, _ cellNumber: Int, _ labelIdentifier: String, _ value: String) {
        let labelValue = app.tables[tableViewIdentifier].cells.element(boundBy: cellNumber).staticTexts[labelIdentifier].label
        XCTAssertTrue(labelValue == value, "Cell label value is \(labelValue) not \(value) as expected")
    }
    
    func tableViewCellExist(_ tableViewIdentifier: String, _ cellIdentifier: String){
        XCTAssertTrue(app.tables[tableViewIdentifier].cells[cellIdentifier].isHittable, "Table View Cell \(cellIdentifier) does not exist")
    }
    
    func tableViewCellDoesNotExist (_ tableViewIdentifier: String, _ cellIdentifier: String){
        XCTAssertFalse(app.tables[tableViewIdentifier].cells[cellIdentifier].isHittable, "Table View Cell \(cellIdentifier) exists")
    }
    
    
}

