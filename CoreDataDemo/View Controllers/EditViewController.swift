//
//  EditViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 06/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    let stackView = UIStackView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 100)))
    let nameView = DetailView()
    let ageView = DetailView()
    let genderView = DetailView()

    public var person: Person?
    weak var delegate: EditPersonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(stackView)

        configureStackView()
        setStackViewConstraints()
        setKeyAndValue()
        setAccessability()
        setEditButtons()
        setNavigationBar()

    }

    private func setEditButtons() {
        nameView.editButton.isUserInteractionEnabled = false
        ageView.editButton.isUserInteractionEnabled = false
        genderView.editButton.isUserInteractionEnabled = false
    }

    private func setNavigationBar() {
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEdit))
        super.navigationItem.title = person?.name?.uppercased()
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "editContactButton"
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

        stackView.addArrangedSubview(nameView)
        stackView.addArrangedSubview(ageView)
        stackView.addArrangedSubview(genderView)
    }

    private func setKeyAndValue() {

        let name = person?.name ?? ""
        let age = "\(person?.age ?? 0)"
        let gender = person?.gender ?? ""

        nameView.set(key: "Name", value: name)
        ageView.set(key: "Age", value: age)
        genderView.set(key: "Gender", value: gender)

    }

    private func setAccessability() {

        nameView.keyLabel.accessibilityIdentifier = "nameLabel"
        nameView.editButton.accessibilityIdentifier = "nameEditButton"
        nameView.valueLabel.accessibilityIdentifier = "contactNameLabel"

        ageView.keyLabel.accessibilityIdentifier = "ageLabel"
        ageView.editButton.accessibilityIdentifier = "ageEditButton"
        ageView.valueLabel.accessibilityIdentifier = "contactAgeLabel"

        genderView.keyLabel.accessibilityIdentifier = "genderLabel"
        genderView.editButton.accessibilityIdentifier = "genderEditButton"
        genderView.valueLabel.accessibilityIdentifier = "contactGenderLabel"
        

    }

    private func setStackViewConstraints() {

        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true

    }
    
    @objc private func didTapEdit() {
        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "doneButton"

        nameView.editButton.isUserInteractionEnabled = true
        ageView.editButton.isUserInteractionEnabled = true
        genderView.editButton.isUserInteractionEnabled = true

    }
    
    @objc private func didTapDone() {
        person?.name = nameView.valueLabel.text
        let age = Int(ageView.valueLabel.text ?? "")
        person?.age = Int64(age ?? 0)
        person?.gender = genderView.valueLabel.text

        nameView.editButton.isUserInteractionEnabled = false
        ageView.editButton.isUserInteractionEnabled = false
        genderView.editButton.isUserInteractionEnabled = false

        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEdit))
        delegate?.editPerson()
        super.navigationItem.title = person?.name?.uppercased()
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "editContactButton"
    }

}
