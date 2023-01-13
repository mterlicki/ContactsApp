//
//  ContactCell.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 13/01/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    let mainStack = UIStackView()
    let secondaryStack = UIStackView()

    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let genderLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainStack)

        configureMainStackView()
        setMainStackViewConstraints()
        configureSecondaryStackView()
        setAccessibility()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(contact: Person) {
        configureLabel(text: contact.name ?? "", label: nameLabel, isBold: true)
        configureLabel(text: "Age: \(contact.age)", label: ageLabel, isBold: false)
        configureLabel(text: "Gender: \(contact.gender ?? "")", label: genderLabel, isBold: false)
        self.accessibilityIdentifier = contact.name
    }

    private func setAccessibility() {
        nameLabel.accessibilityIdentifier = "personNameLabel"
        genderLabel.accessibilityIdentifier = "personGenderLabel"
        ageLabel.accessibilityIdentifier = "personAgeLabel"
    }

    private func configureMainStackView() {
        mainStack.clipsToBounds = true
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.spacing = 5
        mainStack.axis = .vertical
        mainStack.backgroundColor = .systemBackground
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 12, right: 20)

        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(secondaryStack)

    }

    private func configureSecondaryStackView() {
        secondaryStack.clipsToBounds = true
        secondaryStack.translatesAutoresizingMaskIntoConstraints = false
        secondaryStack.spacing = 30
        secondaryStack.axis = . horizontal
        secondaryStack.backgroundColor = .systemBackground
        secondaryStack.isLayoutMarginsRelativeArrangement = true
        secondaryStack.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)

        secondaryStack.addArrangedSubview(ageLabel)
        secondaryStack.addArrangedSubview(genderLabel)
    }

    private func setMainStackViewConstraints() {
        mainStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
    }

    private func configureLabel (text: String, label: UILabel, isBold: Bool) {
        if isBold {
            let atributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let atributedText = NSAttributedString(string: text, attributes: atributes)
            label.attributedText = atributedText
        } else {
            let atributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12)
            ]
            let atributedText = NSAttributedString(string: text, attributes: atributes)
            label.attributedText = atributedText
        }

        label.numberOfLines = 0

    }

}
