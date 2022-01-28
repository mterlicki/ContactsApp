//
//  PersonViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 28/01/2022.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    var person: Person?
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let person = person {
            nameTextField.text = person.name
            ageTextField.text = "\(person.age)"
            genderTextField.text = person.gender
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
