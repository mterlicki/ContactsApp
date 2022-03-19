//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 19/03/2022.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var gender: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}
