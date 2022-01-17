//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 10/09/2021.
//

import UIKit

// MARK: - View Controler
class ViewController: UIViewController {

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
        let alert = UIAlertController(title: "New person", message: "Add new person", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        //alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { _ in
            guard let filed = alert.textFields?.first, let text = filed.text, !text.isEmpty else {
                return
            }
            
            self.createPerson(name: text, gender: "men", age: 64)
        }))
    
        present(alert, animated: true)
        
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
        
    
    func createPerson(name: String, gender: String, age: Int64){
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.gender = gender
        newPerson.age = age
        
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

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Selected person
        let person = self.persons[indexPath.row]
        
        //Alert to edit name
        
        let alert = UIAlertController(title: "Edit person", message: "Edit name", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = person.name
        
        //Configure button handler
        
        let  saveButton = UIAlertAction(title: "Save", style:. default) {(action) in
            
            let textfield = alert.textFields![0]
            
            person.name = textfield.text
            
            //Save changes
            self.updatePerson(person: person, newName: textfield.text!, newGender: "men", newAge:22)
            
            //Refreshing tableView
            self.getAllPersons()
    }
        // Adding button
        
        alert.addAction(saveButton)
        
        //Presenting alert
        self.present(alert, animated: true, completion: nil)
}
}

extension ViewController: UITableViewDataSource{
    
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
