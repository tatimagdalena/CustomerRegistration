//
//  RegisterViewController.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    // MARK: Outlets & actions
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var businessNameTextField: UITextField!
    @IBOutlet var cnpjTextField: UITextField!
    @IBOutlet var startDateTextField: DateTextField!
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
    private var disposeBag = DisposeBag()
    private var viewModel: RegisterViewModel!
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
        
        configureReactiveBehavior()
        
        requestData()
    }
    
}

// MARK: - RxSwift

extension RegisterViewController {
    
    func configureReactiveBehavior() {
        nameTextField.rx.text.orEmpty
            .bind(to: viewModel.fullName)
            .disposed(by: disposeBag)
        
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        phoneTextField.rx.text.orEmpty
            .bind(to: viewModel.phone)
            .disposed(by: disposeBag)
        
        businessNameTextField.rx.text.orEmpty
            .bind(to: viewModel.businessName)
            .disposed(by: disposeBag)
        
        cnpjTextField.rx.text.orEmpty
            .bind(to: viewModel.cnpj)
            .disposed(by: disposeBag)
        
        viewModel.fullNameValidation
            .subscribe(onNext: { status in
                self.nameTextField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
            })
            .disposed(by: disposeBag)
        
        viewModel.emailValidation
            .subscribe(onNext: { status in
                self.emailTextField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
            })
            .disposed(by: disposeBag)
        
        viewModel.phoneValidation
            .subscribe(onNext: { status in
                self.phoneTextField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
            })
            .disposed(by: disposeBag)
        
        viewModel.businessNameValidation
            .subscribe(onNext: { status in
                self.businessNameTextField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
            })
            .disposed(by: disposeBag)
        
        viewModel.cnpjValidation
            .subscribe(onNext: { status in
                self.cnpjTextField.layer.borderColor = UIColor(hexString: status.colorHex.rawValue).cgColor
            })
            .disposed(by: disposeBag)
        
        viewModel.isReadyToRegister
            .bind(to: doneButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
}

// MARK: - View configuration -

private extension RegisterViewController {
    
    func configureInitialState() {
        // dismiss keyboard when touching outside
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        configureTextFields()
        doneButton.isEnabled = false
        meiSwitch.isOn = customerInput.isMei
        startDateTextField.updateTextFrom(date: customerInput.startDate)
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

// MARK: - Textfield -

extension RegisterViewController: UITextFieldDelegate, DateTextFieldDelegate {
    
    func configureTextFields() {
        
        startDateTextField.datePickerDelegate = self
        
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        }
        return false
    }
    
    func dateDidChange(date: Date) {
        print("Do anything with date \(date)")
    }
    
}


