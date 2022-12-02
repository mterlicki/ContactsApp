//
//  NumberEditView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 25/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class NumberEditView: UIView {

    let mainStack = UIStackView()
    let textEditStack = UIStackView()
    let keyLabel = UILabel()
    let textField = UITextField()
    let stepper = UIStepper()
    let errorLabel = UILabel()

    func set(key: String, placeholder: String?, errorMessage: String, value: String) {
        self.addSubview(mainStack)

        configureMainStack(key: key, placeholder: placeholder, errorMessage: errorMessage, value: value)

    }

    private func configureMainStack(key: String, placeholder: String?, errorMessage: String, value: String) {

        mainStack.clipsToBounds = true
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.spacing = 20
        mainStack.axis = .vertical
        mainStack.backgroundColor = .systemGray5
        mainStack.layer.cornerRadius = 10
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)

        configureTextEditStack(key: key, placeholder: placeholder, value: value)
        setErrorLabelValue(value: errorMessage)

        mainStack.addArrangedSubview(textEditStack)
        mainStack.addArrangedSubview(errorLabel)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

    private func configureTextEditStack(key: String, placeholder: String?, value: String) {
        textEditStack.clipsToBounds = true
        textEditStack.translatesAutoresizingMaskIntoConstraints = false
        textEditStack.spacing = 4
        textEditStack.axis = .horizontal
        textEditStack.isLayoutMarginsRelativeArrangement = true
        textEditStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        configureLabel(text: key, label: keyLabel, isBold: true)
        configureTextField(placeholder: placeholder, value: value)

        textEditStack.addArrangedSubview(keyLabel)
        textEditStack.addArrangedSubview(textField)
        textEditStack.addArrangedSubview(stepper)

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
                .font: UIFont.systemFont(ofSize: 10)
            ]
            let atributedText = NSAttributedString(string: text, attributes: atributes)
            label.attributedText = atributedText
        }

        label.numberOfLines = 0

    }

    private func configureTextField(placeholder: String?, value: String) {

        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.placeholder = placeholder
        textField.text = value

    }

    private func setErrorLabelValue(value: String) {

        configureLabel(text: value, label: errorLabel, isBold: false)
        errorLabel.textColor = .systemRed

    }

}
