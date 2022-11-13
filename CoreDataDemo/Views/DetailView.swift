//
//  KeyValueView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 12/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class DetailView: UIView {

    let mainStack = UIStackView()
    let labelStack = UIStackView()
    let keyLabel = UILabel()
    let valueLabel = UILabel()
    let editButton = UIButton()

    func set(key: String, value: String) {
        self.addSubview(mainStack)
        configureMainStack(key: key, value: value)
    }

    func configureMainStack (key: String, value: String) {
        mainStack.clipsToBounds = true
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.spacing = 20
        mainStack.axis = .horizontal
        mainStack.backgroundColor = .systemGray5
        mainStack.layer.cornerRadius = 10
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)

        configureLabelStackView(key: key, value: value)
        configureEditButton()

        mainStack.addArrangedSubview(labelStack)
        mainStack.addArrangedSubview(editButton)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            editButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func configureLabelStackView (key: String, value: String) {
        labelStack.clipsToBounds = true
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        labelStack.spacing = 4
        labelStack.axis = .vertical
        labelStack.isLayoutMarginsRelativeArrangement = true
        labelStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        configureLabel(text: key, label: keyLabel, isBold: false)
        configureLabel(text: value, label: valueLabel, isBold: true)

        labelStack.addArrangedSubview(keyLabel)
        labelStack.addArrangedSubview(valueLabel)

    }

    func configureLabel (text: String, label: UILabel, isBold: Bool) {
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

    func configureEditButton () {

        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editButton.isAccessibilityElement = true
        editButton.addTarget(self, action: #selector(showEditView), for: .touchUpInside)
        editButton.isEnabled = true
        editButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        editButton.translatesAutoresizingMaskIntoConstraints = false

    }

    @objc private func showEditView() {
        let keyName = keyLabel.text?.lowercased()
        createAlert(title: "Edit \(keyName ?? "")", message: "Type new \(keyName ?? "")", label: valueLabel)
    }
    
    private func createAlert(title: String, message: String, label: UILabel) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.text = label.text
        alert.textFields?.first?.accessibilityIdentifier = "alertTextField"
        alert.view.accessibilityIdentifier = "editAlert"

        let submitButton = UIAlertAction(title: "Submit", style: .default, handler: { _ in

            guard let filed = alert.textFields?.first, let text = filed.text, !text.isEmpty
            else {
                return
            }

            label.text = text
        })
        submitButton.accessibilityIdentifier = "alertSubmitButton"

        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
            return
        })
        cancelButton.accessibilityIdentifier = "alertCancelButton"

        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        self.window?.rootViewController?.present(alert, animated: true)

    }
}
