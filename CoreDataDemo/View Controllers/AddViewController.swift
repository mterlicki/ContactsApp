//
//  AddViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 25/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

protocol AddDelegete: AnyObject {
    func addPerson(name: String, age: Int64, gender: String)
}

class AddViewController: UIViewController {

    let stackView = UIStackView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 100)))

    let nameTextField = TextEditView(with: .name)
    let ageTextField = NumberEditView(with: .age)
    let genderTextField = TextEditView(with: .gender)

    weak var delegate: AddDelegete?

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
    }

    private func configureNavigationBar() {
        super.navigationItem.title = "Add contact"
        super.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                 target: self,
                                                                 action: #selector(didTapCancel))
        super.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "cancelButton"

        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "saveButton"
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

    @objc func didTapCancel() {

        self.dismiss(animated: true, completion: nil)

    }

    @objc func didTapSave() {

        self.dismiss(animated: true, completion: nil)

    }

    private func configureNameTextField() {

        nameTextField.set(key: "Name:", placeholder: "Type name", errorMessage: "Required")

    }

    private func configureGenederTextField() {

        genderTextField.set(key: "Gender:", placeholder: "Type men/woman/nn", errorMessage: "Required")

    }

    private func configureAgeTextField() {

        ageTextField.set(key: "Age:", placeholder: "", errorMessage: "", value: "18")

    }

}
