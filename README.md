# Contacts App

Contacts App is a app with list of contacts. Each contact contains information about name, age and gender of person. 

Data is stored in CoreData.

## App requirements

### Contacts List
* List shows all contacts added to database.
* From list view user can add new contact using „+” button.
* From list view user can delete button using swipe left gesture on list element.
* List is ordered by order of adding, oldest first.

### Add new contact
* Add new contact form has 3 fields: name, age, gender.
* All fields are required to save contact.
* Name field can’t be empty.
* Age field must contain only number.
* Age must be number between 0 and 99.
* Age can be changed from numeric keyboard or by stepper. 
* Gender field shall have the following values: men/women/nn.
* Error labels shows information about incorrect data.

### Contact Preview
* Preview shows details about contact.
* All details are editable.
* Edit buttons are active after hitting „Edit” button.
* Hitting „Done” saves data.

# General Notes

### Getting started

#### Requirements
1. Xcode 13 or higher
2. iOS 15 or higher

#### How to install
1. Fork the repo
2. Clone the repo
3. Run 'CoreDataDemo.xcodeproj' file

#### Views

Views are writen in storyboards and UIKit.

# UI Tests

Tests are written in XCUITest. View models are based on page object pattern.

#### Page object model

Models for screens are palaced in `CoreDataDemoUITests/Screens/` catalouge. Each screen confroms to BaseScreen protocol and uses its extenssions to handle UI elements and assertions.

#### Tests

UI tests are placed in `CoreDataDemoUITests/Tests` catalouge. Each test class conforms to BaseTest protocol.

#### Test running

To run tests use `⌘+U` shortcut or run manualy from `Test Navigator` in XCode.
