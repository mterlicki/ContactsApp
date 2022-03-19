//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 10/09/2021.
//

import UIKit

// MARK: - View Controler
class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var persons = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "People"
        getAllPersons()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    
    @objc private func didTapAdd(){
        
        guard let addPersonViewController = storyboard?.instantiateViewController(withIdentifier: "addPersonViewController") as? AddPersonViewController else { return }
        
        
        self.present(UINavigationController(rootViewController: addPersonViewController), animated: true, completion: nil)

        
    }
    
    // MARK: Core data functions
    
    func getAllPersons(){
        
        do{
            persons = try context.fetch(Person.fetchRequest())
        }
        catch{
            print("Error getting context getAllPersons")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
        
    
    func addPerson(person: Person){
        let newPerson = Person(context: context)
        newPerson.name = person.name
        newPerson.gender = person.gender
        newPerson.age = person.age
        
        do{
            try context.save()
            getAllPersons()
        }
        catch{
            print("Error saving context on creating person")
        }
    }
    
    func deletePerson(person: Person){
        
        context.delete(person)
        
        do{
            try context.save()
        }
        catch{
            print("Error saving context on deleting person")
        }
    }
    
    func updatePerson(person: Person, newName: String, newGender: String, newAge: Int64 ){
        person.name = newName
        person.gender = newGender
        person.age = newAge
        
        do{
            try context.save()
        }
        catch{
            print("Error saving context update person")
        }
    }
}

// MARK: Table View functions

extension ContactsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //  Selected person
        let selectedPerson = self.persons[indexPath.row]

        guard let personViewController = storyboard?.instantiateViewController(withIdentifier: "personVC") as? EditPersonViewController else { return  }
        personViewController.delegate = self
        personViewController.person = selectedPerson
        self.navigationController?.pushViewController(personViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ContactsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        let personCell = tableView.dequeueReusableCell(withIdentifier: "Person", for: indexPath) as? PersonCell
        personCell?.setCell(with: person)
        
        return personCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
        
            let personToRemove = self.persons[indexPath.row]
            
            self.deletePerson(person: personToRemove)
            
            do{
                try self.context.save()
            }
            catch{
                
            }
            
            self.getAllPersons()
            
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

extension ContactsViewController: EditPersonDelegate{
    
    func editPerson() {
        self.tableView.reloadData()
    }
}

extension ContactsViewController: AddPersonDelegate{
    func addPerson(){
        self.tableView.reloadData()
        
    }
}
