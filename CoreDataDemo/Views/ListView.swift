//
//  ListView.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 13/01/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//
// swiftlint:disable force_cast

import UIKit

class ListView: UIViewController {

    let listViewModel = ListViewModel()

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel.getAllPersons()
        reloadTableView()
        self.view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.loadTestDataIfNeeded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func setupView() {

        setupTableView()
        setNavigationBar()
        setAccesability()
    }

    private func setupTableView() {

        setTableViewConstraints()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")

        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension

    }

    private func setTableViewConstraints() {
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }

    private func setNavigationBar () {

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
        navigationItem.title = "Contacts"

    }

    private func setAccesability() {

        tableView.accessibilityIdentifier = "contactTableView"
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addContactButton"
    }

    @objc private func didTapAdd() {

        let addViewController = AddView()

        addViewController.addViewModel.delegate = self
        self.present(UINavigationController(rootViewController: addViewController),
                     animated: true,
                     completion: nil)
    }

    private func reloadTableView () {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
// MARK: Table View functions

extension ListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //  Selected person
        let selectedPerson = listViewModel.persons[indexPath.row]

        let personViewController = EditView()
        personViewController.editViewModel.delegate = self
        personViewController.editViewModel.person = selectedPerson
        self.navigationController?.pushViewController(personViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = listViewModel.persons[indexPath.row]
        lazy var cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.set(contact: person)

        return cell
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in

            let personToRemove = self.listViewModel.persons[indexPath.row]

            self.listViewModel.deletePerson(person: personToRemove)

            do {
                try self.listViewModel.context.save()
            } catch {
                fatalError("Error saving context delete person")
            }

            self.listViewModel.getAllPersons()
            self.reloadTableView()

        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: Extensions

extension ListView: EditDelegate {

    func editPerson() {
        do {
            try listViewModel.context.save()
        } catch {
            fatalError("Error saving context edit person")
        }
        listViewModel.getAllPersons()
        reloadTableView()
    }
}

extension ListView: AddDelegete {
    func addPerson(name: String, age: Int64, gender: String) {

        listViewModel.addNewPerson(name: name, age: age, gender: gender)

        listViewModel.getAllPersons()
        reloadTableView()

    }
}
