//
//  RegisterViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: Outlets & actions
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var businessNameTextField: UITextField!
    @IBOutlet var cnpjTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        guard let newText = sender.text else { return }
        handleNewText(newText, onTextField: sender)
    }
    
    @IBOutlet var startDateTitleLabel: UILabel!
    @IBOutlet var meiTitleLabel: UILabel!
    @IBOutlet var meiSwitch: UISwitch!
    @IBOutlet var doneButton: UIButton!
    @IBAction func register(_ sender: Any) {
        sendRegister()
    }
    
    @IBOutlet var toolbarView: UIView!
    @IBAction func closeKeyboard(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    // MARK: Properties
    private var viewModel: RegisterViewModel!
    private let dateFormatter = DateFormatter()
    private let datePickerView = UIDatePicker()
    private var customerInput = CustomerInput()
}

// MARK: - Lifecycle -

extension RegisterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialState()
        
        viewModel = RegisterViewModel(headlinesDataSource: DataBaseHeadlines(),
                                      nameValidator: NameValidator(),
                                      emailValidator: EmailValidator(),
                                      phoneValidator: PhoneValidator(),
                                      cnpjValidator: CNPJValidator(),
                                      customerFormatter: CustomerFormatter())
        requestData()
    }
    
}

// MARK: - View configuration -

private extension RegisterViewController {
    
    func configureInitialState() {
        // dismiss keyboard when touching outside
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        configureDateFormatter()
        configureTextFields()
        doneButton.isEnabled = false
        meiSwitch.isOn = customerInput.isMei
        datePickerView.date = customerInput.startDate
    }
    
    func configureDateFormatter() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd MMMM yyyy"
    }
    
    func fillHeadlines(_ headlines: Headlines) {
        nameTextField.placeholder = headlines.fullName
        emailTextField.placeholder = headlines.email
        phoneTextField.placeholder = headlines.phone
        businessNameTextField.placeholder = headlines.businessName
        cnpjTextField.placeholder = headlines.cnpj
        startDateTitleLabel.text = headlines.startDate
        meiTitleLabel.text = headlines.isMei
    }
    
    func updateTextFieldUI(_ textField: UITextField, status: ValidationStatus) {
        textField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
    }
    
    func updateDoneButtonUI(status: ValidationStatus) {
        switch status {
        case .valid(let enable): doneButton.isEnabled = enable
        case .invalid: doneButton.isEnabled = false
        }
    }
    
}

// MARK: - Data -

private extension RegisterViewController {
    
    func requestData() {
        let headlines = viewModel.getHeadlines()
        fillHeadlines(headlines)
    }
    
    func sendRegister() {
        let result = viewModel.register(customerInput: customerInput)
        if result.booleanValue == true {
            navigationController?.popViewController(animated: true)
        }
        else {
            // TODO: Handle error
            print("Unable to perform register")
        }
    }
    
}

// MARK: - Date picker -

extension RegisterViewController {
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        startDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
}

// MARK: - Textfield -

extension RegisterViewController: UITextFieldDelegate {
    
    func configureTextFields() {
        
        // start date
        addDatePickerToTextField(startDateTextField)
        
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
    
    func addDatePickerToTextField(_ textField: UITextField) {
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.maximumDate = Date()
        datePickerView.date = Date()
        textField.inputView = datePickerView
        textField.text = dateFormatter.string(from: datePickerView.date)
        datePickerView.addTarget(self, action: #selector(RegisterViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        guard let newText = textField.text,
            textField != startDateTextField
            else { return }
        handleNewText(newText, onTextField: textField)
    }
    
    func handleNewText(_ newText: String, onTextField textField: UITextField) {
        var status = ValidationStatus.invalid(description: "")
        
        switch textField {
        case nameTextField:
            customerInput.fullName = newText
            status = viewModel.fullNameChanged(newName: newText)
        case emailTextField:
            customerInput.email = newText
            status = viewModel.emailChanged(newEmail: newText)
        case phoneTextField:
            customerInput.phone = newText
            status = viewModel.phoneChanged(newPhone: newText)
        case cnpjTextField:
            customerInput.cnpj = newText
            status = viewModel.cnpjChanged(newCNPJ: newText)
        case businessNameTextField:
            customerInput.businessName = newText
            status = viewModel.businessNameChanged(newBusinessName: newText)
        default: break
        }
        
        updateTextFieldUI(textField, status: status)
        updateDoneButtonUI(status: status)
    }
    
}
