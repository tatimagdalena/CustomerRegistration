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
    @IBOutlet var startDateTextField: UITextField!
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.maximumDate = Date()
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RegisterViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @IBOutlet var startDateTitleLabel: UILabel!
    @IBOutlet var meiTitleLabel: UILabel!
    @IBOutlet var meiSwitch: UISwitch!
    @IBOutlet var doneButton: UIButton!
    @IBAction func register(_ sender: Any) {
        print("done")
    }
    
    @IBOutlet var toolbarView: UIView!
    @IBAction func closeKeyboard(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        configureTextFields()
        // dismiss keyboard when touching outside
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }
    
}

// MARK: - Date picker -

extension RegisterViewController {
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        startDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
}

// MARK: - Textfield -

extension RegisterViewController: UITextFieldDelegate {
    
    func configureTextFields() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        businessNameTextField.delegate = self
        cnpjTextField.delegate = self
        startDateTextField.delegate = self
        
        nameTextField.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), for: .editingChanged)
        businessNameTextField.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), for: .editingChanged)
        cnpjTextField.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        // start date
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.maximumDate = Date()
        startDateTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RegisterViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        nameTextField.inputAccessoryView = toolbarView
        emailTextField.inputAccessoryView = toolbarView
        phoneTextField.inputAccessoryView = toolbarView
        businessNameTextField.inputAccessoryView = toolbarView
        cnpjTextField.inputAccessoryView = toolbarView
        startDateTextField.inputAccessoryView = toolbarView
        
        nameTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderWidth = 0.5
        phoneTextField.layer.borderWidth = 0.5
        businessNameTextField.layer.borderWidth = 0.5
        cnpjTextField.layer.borderWidth = 0.5
        startDateTextField.layer.borderWidth = 0.5
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
    }
}
