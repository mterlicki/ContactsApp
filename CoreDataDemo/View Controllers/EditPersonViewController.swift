//
//  PersonViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 28/01/2022.
//  Copyright © 2022 Michal Terlicki. All rights reserved.
//

import UIKit

protocol EditPersonDelegate{
    func editPerson()
}

class EditPersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var editNameButton: UIButton!
    @IBOutlet weak var editAgeButton: UIButton!
    @IBOutlet weak var editGenderButton: UIButton!
    
    public var person: Person?
    var delegate: EditPersonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style:.plain , target: self, action: #selector(didTapEdit))
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "editContactButton"
        super.navigationItem.title = person?.name?.uppercased()
        
        nameLabel.text = person?.name
        ageLabel.text = "\(person?.age ?? 0)"
        genderLabel.text = person?.gender
        
        editNameButton.isUserInteractionEnabled = false
        editAgeButton.isUserInteractionEnabled = false
        editGenderButton.isUserInteractionEnabled = false
    }
    
    @IBAction func editName(_ sender: Any) {
        createAlert(title: "Edit name", message: "Type new name", label: nameLabel)
        
    }
    
    @IBAction func editAge(_ sender: Any) {
        createAlert(title: "Edit age", message: "Type new age", label: ageLabel)
    }
    
    
    @IBAction func editGender(_ sender: Any) {
        createAlert(title: "Edit gender", message: "Type new gender", label: genderLabel)
        
    }
    
    @objc private func didTapDone(){
        person?.name = nameLabel.text
        let age = Int(ageLabel.text ?? "")
        person?.age = Int64(age ?? 0)
        person?.gender = genderLabel.text
        
        editNameButton.isUserInteractionEnabled = false
        editAgeButton.isUserInteractionEnabled = false
        editGenderButton.isUserInteractionEnabled = false
        
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style:.plain , target: self, action: #selector(didTapEdit))
        delegate?.editPerson()
        super.navigationItem.title = person?.name?.uppercased()
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "editContactButton"
    }
    
    @objc private func didTapEdit(){
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        super.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "doneButton"
        
        editNameButton.isUserInteractionEnabled = true
        editAgeButton.isUserInteractionEnabled = true
        editGenderButton.isUserInteractionEnabled = true
        
    }
    
    
    func createAlert(title: String, message: String, label: UILabel) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.text = label.text
        alert.textFields?.first?.accessibilityIdentifier = "alertTextField"
        alert.view.accessibilityIdentifier = "editAlert"
        
        let submitButton = UIAlertAction(title: "Submit", style: .default, handler: { _ in
            
            guard let filed = alert.textFields?.first, let text = filed.text, !text.isEmpty
            else {
                return
            }
            
            label.text = text
        })
        submitButton.accessibilityIdentifier = "alertSubmitButton"
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
            return
        })
        cancelButton.accessibilityIdentifier = "alertCancelButton"
        
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
        
    }
        

}
