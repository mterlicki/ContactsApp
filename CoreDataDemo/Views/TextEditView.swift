//
//  TextEditView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 25/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

enum TextFieldType {
    case name
    case gender
}

class TextEditView: UIView {

    let mainStack = UIStackView()
    let textEditStack = UIStackView()
    let keyLabel = UILabel()
    let textField = UITextField()
    let errorLabel = UILabel()
    let type: TextFieldType

    init (with fieldType: TextFieldType) {
        type = fieldType
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(key: String, placeholder: String?, errorMessage: String) {
        self.addSubview(mainStack)

        configureMainStack(key: key, placeholder: placeholder, errorMessage: errorMessage)

    }

    private func configureMainStack(key: String, placeholder: String?, errorMessage: String) {

        mainStack.clipsToBounds = true
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.spacing = 20
        mainStack.axis = .vertical
        mainStack.backgroundColor = .systemGray5
        mainStack.layer.cornerRadius = 10
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)

        configureTextEditStack(key: key, placeholder: placeholder)
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

    private func configureTextEditStack(key: String, placeholder: String?) {
        textEditStack.clipsToBounds = true
        textEditStack.translatesAutoresizingMaskIntoConstraints = false
        textEditStack.spacing = 4
        textEditStack.axis = .horizontal
        textEditStack.isLayoutMarginsRelativeArrangement = true
        textEditStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        configureLabel(text: key, label: keyLabel, isBold: true)
        configureTextField(placeholder: placeholder)

        textEditStack.addArrangedSubview(keyLabel)
        textEditStack.addArrangedSubview(textField)

    }

    private func configureLabel (text: String, label: UILabel, isBold: Bool) {
        if isBold {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            label.attributedText = attributedText
        } else {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 10)
            ]
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            label.attributedText = attributedText
        }

        label.numberOfLines = 0

    }

    private func configureTextField(placeholder: String?) {

        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(TextEditView.textFieldDidChange(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(TextEditView.textFieldDidChange(_:)), for: .editingDidEnd)

    }

    func setErrorLabelValue(value: String) {

        configureLabel(text: value, label: errorLabel, isBold: false)
        errorLabel.textColor = .systemRed

    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        let textFieldValue = textField.text ?? ""
        textValidator(text: textFieldValue)
    }

    private func textValidator(text: String) {
        let errorMessage: String
        switch type {
        case .name:
            errorMessage = validateName(text: text)
        case .gender:
            errorMessage = validateGender(text: text)
        }

        setErrorLabelValue(value: errorMessage)
    }
    private func validateName(text: String) -> String {
        if text.count == 0 {
            return "Name is required"
        }
        return " "
    }

    private func validateGender(text: String) -> String {
        if text.count == 0 {
            return "Gender is required"
        }
        if text != "men" && text != "woman" && text != "nn" {
            return "Invalid gender, type: men/woman/nn"
        }
        return " "
    }

}
