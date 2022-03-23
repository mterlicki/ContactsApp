//
//  AddPersonViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 19/03/2022.
//

import UIKit

protocol AddPersonDelegate{
    func addPerson(name: String, age: Int64, gender: String)
}

class AddPersonViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        ageTextField.text = Int(sender.value).description
    }
    
    
    var delegate: AddPersonDelegate?
    
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
        let name = nameTextField.text ?? ""
        let gender = genderTextField.text ?? ""
        let age = Int(ageTextField.text ?? "")
    
        delegate?.addPerson(name: name, age: Int64(age ?? 0), gender: gender)
        self.dismiss(animated: true, completion: nil)
    }
}
