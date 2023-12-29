//
//  EditViewModel.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 04/02/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//

import Foundation

protocol EditDelegate: AnyObject {
    func editPerson()
}

class EditViewModel {

    public var person: Person?
    weak var delegate: EditDelegate?

}
