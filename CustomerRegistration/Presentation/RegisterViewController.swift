//
//  RegisterViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var businessNameTextField: UITextField!
    @IBOutlet var cnpjTextField: UITextField!
    @IBOutlet var startDateTitleLabel: UILabel!
    
    @IBOutlet var meiTitleLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var meiPicker: UISwitch!
    @IBOutlet var doneButton: UIButton!
    @IBAction func register(_ sender: Any) {
        print("done")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
