//
//  ListViewModel.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 04/02/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//
// swiftlint:disable force_cast

import Foundation
import UIKit

class ListViewModel {

    let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext

    var persons = [Person]()

    // MARK: Core data functions

    func getAllPersons() {

        do {
            persons = try context.fetch(Person.fetchRequest())
        } catch {
            print("Error getting context getAllPersons")
        }

    }

    func addNewPerson(name: String, age: Int64, gender: String) {
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.gender = gender
        newPerson.age = age
        newPerson.id = UUID()

        do {
            try context.save()
        } catch {
            fatalError("Error saving context on creating person")
        }

    }

    func deletePerson(person: Person) {

        context.delete(person)

        do {
            try context.save()
        } catch {
            fatalError("Error saving context on deleting person")
        }
    }

    func updatePerson(person: Person, newName: String, newGender: String, newAge: Int64 ) {
        person.name = newName
        person.gender = newGender
        person.age = newAge

        do {
            try context.save()
        } catch {
            fatalError("Error saving context update person")
        }
    }

}

// MARK: Extensions

extension ListView: EditDelegate {

    func editPerson() {
        do {
            try listViewModel.context.save()
        } catch {
            fatalError("Error saving context edit person")
        }
        listViewModel.getAllPersons()
        reloadTableView()
    }
}

extension ListView: AddDelegete {
    func addPerson(name: String, age: Int64, gender: String) {

        listViewModel.addNewPerson(name: name, age: age, gender: gender)

        listViewModel.getAllPersons()
        reloadTableView()

    }
}
