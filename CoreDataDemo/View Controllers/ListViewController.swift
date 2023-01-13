//
//  ListViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 13/01/2023.
//  Copyright © 2023 Michal Terlicki. All rights reserved.
//
// swiftlint:disable force_cast

import UIKit

class ListViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.persistentContainer.viewContext

    private var persons = [Person]()

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllPersons()
        self.view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        setupView()
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

        let addViewController = AddViewController()

        addViewController.delegate = self
        self.present(UINavigationController(rootViewController: addViewController),
                     animated: true,
                     completion: nil)
    }
    
    // MARK: Core data functions

    func getAllPersons() {

        do {
            persons = try context.fetch(Person.fetchRequest())
        } catch {
            print("Error getting context getAllPersons")
        }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func addNewPerson(name: String, age: Int64, gender: String) {
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.gender = gender
        newPerson.age = age
        newPerson.id = UUID()

        do {
            try context.save()
        } catch {
            fatalError("Error saving context on creating person")
        }

    }

    func deletePerson(person: Person) {

        context.delete(person)

        do {
            try context.save()
        } catch {
            fatalError("Error saving context on deleting person")
        }
    }

    func updatePerson(person: Person, newName: String, newGender: String, newAge: Int64 ) {
        person.name = newName
        person.gender = newGender
        person.age = newAge

        do {
            try context.save()
        } catch {
            fatalError("Error saving context update person")
        }
    }

}

// MARK: Table View functions

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //  Selected person
        let selectedPerson = self.persons[indexPath.row]

        let personViewController = EditViewController()
        personViewController.delegate = self
        personViewController.person = selectedPerson
        self.navigationController?.pushViewController(personViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        lazy var cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.set(contact: person)

        return cell
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in

            let personToRemove = self.persons[indexPath.row]

            self.deletePerson(person: personToRemove)

            do {
                try self.context.save()
            } catch {
                fatalError("Error saving context delete person")
            }

            self.getAllPersons()

        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: Extensions

extension ListViewController: EditDelegate {

    func editPerson() {
        do {
            try self.context.save()
        } catch {
            fatalError("Error saving context edit person")
        }
        getAllPersons()
    }
}

extension ListViewController: AddDelegete {
    func addPerson(name: String, age: Int64, gender: String) {

        addNewPerson(name: name, age: age, gender: gender)

        getAllPersons()

    }
}
