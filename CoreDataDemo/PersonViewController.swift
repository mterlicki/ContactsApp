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
    
    @objc private func didTapDone(){
        navigationController?.popToRootViewController(animated: true)
    }
    
}
