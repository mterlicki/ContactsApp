//
//  AddView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 25/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class AddView: UIViewController {

    let stackView = UIStackView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 100)))

    let nameTextField = TextEditView(with: .name)
    let ageTextField = NumberEditView(with: .age)
    let genderTextField = TextEditView(with: .gender)

    let addViewModel = AddViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        view.addSubview(stackView)
        setupView()

    }

    private func setupView() {
        configureNavigationBar()

        configureStackView()
        setStackViewConstraints()
        configureNameTextField()
        configureGenederTextField()
        configureAgeTextField()
        setAccessability()
    }

    private func configureNavigationBar() {
        super.navigationItem.title = "Add contact"
        super.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                 target: self,
                                                                 action: #selector(didTapCancel))

        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
    }

    private func configureStackView() {
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.backgroundColor = .systemBackground
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 40, right: 10)

        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(ageTextField)
        stackView.addArrangedSubview(genderTextField)
    }

    private func setStackViewConstraints() {

        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }

    private func setAccessability () {

        nameTextField.keyLabel.accessibilityIdentifier = "nameLabel"
        nameTextField.textField.accessibilityIdentifier = "nameTextField"
        nameTextField.errorLabel.accessibilityIdentifier = "nameErrorLabel"

        ageTextField.keyLabel.accessibilityIdentifier = "ageLabel"
        ageTextField.textField.accessibilityIdentifier = "ageTextField"
        ageTextField.errorLabel.accessibilityIdentifier = "ageErrorLabel"

        genderTextField.keyLabel.accessibilityIdentifier = "genderLabel"
        genderTextField.textField.accessibilityIdentifier = "genderTextField"
        genderTextField.errorLabel.accessibilityIdentifier = "genderErrorLabel"

        super.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "cancelButton"
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "saveButton"
    }

    @objc func didTapCancel() {

        self.dismiss(animated: true, completion: nil)

    }

    @objc func didTapSave() {
        if formHasError() {
            let alert = UIAlertController(title: "Validation error",
                                          message: "The form has errors. Correct the data to save.",
                                          preferredStyle: .alert)
            alert.view.accessibilityIdentifier = "formErrorAlert"

            let okButton = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                return
            })
            okButton.accessibilityIdentifier = "alertOkButton"
            alert.addAction(okButton)

            present(alert, animated: true)

        } else {
            let name = nameTextField.textField.text ?? ""
            let gender = genderTextField.textField.text ?? ""
            let age = Int(ageTextField.textField.text ?? "")

            addViewModel.delegate?.addPerson(name: name, age: Int64(age ?? 0), gender: gender)
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func configureNameTextField() {

        nameTextField.set(key: "Name:", placeholder: "Type name", errorMessage: "Required")

    }

    private func configureGenederTextField() {

        genderTextField.set(key: "Gender:", placeholder: "Type men/woman/nn", errorMessage: "Required")

    }

    private func configureAgeTextField() {

        ageTextField.set(key: "Age:", placeholder: "", errorMessage: " ", value: "18")

    }

    private func formHasError() -> Bool {
        return nameTextField.errorLabel.text != " " ||
                ageTextField.errorLabel.text != " " ||
                genderTextField.errorLabel.text != " "
    }

}
