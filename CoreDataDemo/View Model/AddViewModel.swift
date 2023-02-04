//
//  AddViewModel.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 04/02/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//

import Foundation

protocol AddDelegete: AnyObject {
    func addPerson(name: String, age: Int64, gender: String)
}

class AddViewModel {

    weak var delegate: AddDelegete?

}
