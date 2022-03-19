//
//  AddPersonViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 19/03/2022.
//

import UIKit

protocol AddPersonDelegate{
    func addPerson(person: Person)
}

class AddPersonViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    var delegate: AddPersonDelegate?
    var person: Person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationItem.title = "Add person"
        super.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
    }

    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSave(){
        
        
    }
}
