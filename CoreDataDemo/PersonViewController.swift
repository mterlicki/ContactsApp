//
//  PersonViewController.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 28/01/2022.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    public var person: Person?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        super.navigationItem.title = person?.name?.uppercased()
        
        nameLabel.text = person?.name
        ageLabel.text = "\(person?.age ?? 0)"
        genderLabel.text = person?.gender
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
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func createAlert(title: String, message: String, label: UILabel) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.text = label.text
        
        let submitButton = UIAlertAction(title: "Submit", style: .default, handler: { _ in
            
            guard let filed = alert.textFields?.first, let text = filed.text, !text.isEmpty
            else {
                return
            }
            
            label.text = text
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
            return
        })
        
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
        
    }
}
