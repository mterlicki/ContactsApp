//
//  Contact.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 03/02/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//

import Foundation

protocol ContactProtocol: AnyObject {
    var id: UUID { get }
    var name: String { get }
    var age: Int { get }
    var gender: String { get}
}

// MARK: - Contact
class Contact: ContactProtocol, Codable {
    let id: UUID
    let name: String
    let age: Int
    let gender: String

    init(id: UUID, name: String, age: Int, gender: String) {
        self.id = id
        self.name = name
        self.age = age
        self.gender = gender
    }
}
