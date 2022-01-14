//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 10/09/2021.
//

import UIKit

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
            
            self.createPerson(name: text, gender: "none", age: 64)
        }))
    
        present(alert, animated: true)
        
    }
    
    func getAllPersons(){
        
        do{
            persons = try context.fetch(Person.fetchRequest())
        }
        catch{
            print("Error getting context")
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
            print("Error saving context")
        }
    }
    
    func deletePerson(person: Person){
        
        context.delete(person)
        
        do{
            try context.save()
        }
        catch{
            print("Error saving context")
        }
    }
    
    func upadePerson(person: Person, newName: String, newGender: String, newAge: Int64 ){
        person.name = newName
        person.gender = newGender
        person.age = newAge
        
        do{
            try context.save()
        }
        catch{
            print("Error saving context")
        }
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Selected person
        let person = self.persons[indexPath.row]
        
        //Alert to edit name
        
        let alert = UIAlertController(title: "Edit person", message: "Edit name", preferredStyle: .alert)
        alert.addTextField()
        
        let textfiled = alert.textFields![0]
        textfiled.text = person.name
        
        //Configure button handler
        
        let  saveButton = UIAlertAction(title: "Save", style:. default) {(action) in
            
            let textfield = alert.textFields![0]
            
            person.name = textfiled.text
            
            //Save changes
            
            do {
                try self.context.save()
            }
            catch{
                
            }
            self.getAllPersons()
    }
        alert.addAction(saveButton)
        
        
        self.present(alert, animated: true, completion: nil)
}
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person", for: indexPath)
        
        cell.textLabel?.text = person.name
        
        return cell
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
