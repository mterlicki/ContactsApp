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
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageErrorLabel: UILabel!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var genderErrorLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
        
    var delegate: AddPersonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationItem.title = "Add person"
        super.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        super.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        nameErrorLabel.text = "Required"
        ageErrorLabel.text = ""
        genderErrorLabel.text = "Required"
            
    }

    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSave(){
        
        if formHasError(){
            let alert = UIAlertController(title: "Validation error", message: "The form has errors. Correct the data to save.", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                return
            })
            
            alert.addAction(cancelButton)
            present(alert, animated: true)
        }
        else
        {
            let name = nameTextField.text ?? ""
            let gender = genderTextField.text ?? ""
            let age = Int(ageTextField.text ?? "")
        
            delegate?.addPerson(name: name, age: Int64(age ?? 0), gender: gender)
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func ageTextFieldChanged(_ sender: Any) {
        if let age = ageTextField.text
        {
            if let errorMessage = invalidAge(age)
            {
                ageErrorLabel.text = errorMessage
                ageErrorLabel.isHidden = false
            }
            else
            {
                ageErrorLabel.text = ""
                self.stepper.value = Double(ageTextField.text!) ?? 0.0
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        ageTextField.text = Int(sender.value).description
    }
    
    private func invalidAge (_ value: String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Age must contain only digits"
        }
        
        return nil
    }
    
    @IBAction func nameChanged(_ sender: Any)
    {
        if let name = nameTextField.text
        {
            if let errorMessage = invalidName(name)
            {
                nameErrorLabel.text = errorMessage
                nameErrorLabel.isHidden = false
            }
            else
            {
                nameErrorLabel.text = ""
            }
        }
    }
    
    private func invalidName (_ value: String) -> String?
    {
        if value.count == 0
        {
            return "Name is required"
        }
        return nil
    }
    
    @IBAction func genderChanged(_ sender: Any) {
        if let gender = genderTextField.text
        {
            if let errorMessage = invalidGender(gender)
            {
                genderErrorLabel.text = errorMessage
                genderErrorLabel.isHidden = false
            }
            else
            {
                genderErrorLabel.text = ""
            }
        }
    }
    
    
    private func invalidGender (_ value: String) -> String?
    {
        if value != "men" && value != "woman" && value != "nn"
        {
            return "Invalid gender, type: men/woman/nn"
        }
        return nil
    }
    
    private func formHasError() -> Bool
    {
        return nameErrorLabel.text != "" || ageErrorLabel.text != "" || genderErrorLabel.text != ""
    }
}
