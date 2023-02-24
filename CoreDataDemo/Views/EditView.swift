//
//  EditView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 06/11/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

class EditView: UIViewController {

    let stackView = UIStackView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 100)))
    let nameView = DetailView()
    let ageView = DetailView()
    let genderView = DetailView()

    let editViewModel = EditViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(stackView)

        setupView()

    }

    private func setupView() {

        configureStackView()
        setStackViewConstraints()
        setKeyAndValue()
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
        super.navigationItem.title = editViewModel.person?.name?.uppercased()
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

        let name = editViewModel.person?.name ?? ""
        let age = "\(editViewModel.person?.age ?? 0)"
        let gender = editViewModel.person?.gender ?? ""

        nameView.set(key: "Name", value: name)
        ageView.set(key: "Age", value: age)
        genderView.set(key: "Gender", value: gender)

    }

    private func setStackViewConstraints() {

        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true

    }

    @objc private func didTapEdit() {
        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))

        nameView.editButton.isUserInteractionEnabled = true
        ageView.editButton.isUserInteractionEnabled = true
        genderView.editButton.isUserInteractionEnabled = true

    }

    @objc private func didTapDone() {
        editViewModel.person?.name = nameView.valueLabel.text
        let age = Int(ageView.valueLabel.text ?? "")
        editViewModel.person?.age = Int64(age ?? 0)
        editViewModel.person?.gender = genderView.valueLabel.text

        nameView.editButton.isUserInteractionEnabled = false
        ageView.editButton.isUserInteractionEnabled = false
        genderView.editButton.isUserInteractionEnabled = false

        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEdit))
        editViewModel.delegate?.editPerson()
        super.navigationItem.title = editViewModel.person?.name?.uppercased()
    }

}
