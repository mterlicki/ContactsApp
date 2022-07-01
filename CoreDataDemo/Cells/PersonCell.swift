//
//  PersonCell.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 14/01/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCell(with person: Person) {
        nameLabel.text = person.name
        ageLabel.text = "Age: \(person.age)"
        genderLabel.text = "Gender: \(person.gender ?? "nn")"
        accessibilityIdentifier = person.name
    }

}
