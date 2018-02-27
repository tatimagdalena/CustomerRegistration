//
//  RegisterViewModel.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation
import RxSwift

struct RegisterViewModel {
    
    // MARK: - Contributors -
    
    private let headlinesDataSource: RetrieveHeadlines
    private let customerFormatter: CustomerFormatter
    private let nameValidator: NameValidator
    private let emailValidator: EmailValidator
    private let phoneValidator: PhoneValidator
    private let cnpjValidator: CNPJValidator
    
    // MARK: - Properties -
    
    private let throttleInterval = 0.1
    
    // MARK: - Rx observers -
    
    var fullName = Variable<String>("")
    var email = Variable<String>("")
    var phone = Variable<String>("")
    var businessName = Variable<String>("")
    var cnpj = Variable<String>("")
    
    var isReadyToRegister: Observable<Bool> {
        let combineCollection = [fullNameValidation, emailValidation, phoneValidation, businessNameValidation, cnpjValidation]
        return Observable.combineLatest(combineCollection) { allValidationStatus -> Bool in
            return allValidationStatus.filter { status in status.booleanValue == false }.isEmpty
        }
    }
    
    var fullNameValidation: Observable<ValidationStatus> {
        return fullName.asObservable()
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map({ name -> Bool in
                return self.nameValidator.validate(name: name)
            })
            .map({ valid -> ValidationStatus in
                return ValidationStatus(bool: valid)
            })
    }
    
    var emailValidation: Observable<ValidationStatus> {
        return email.asObservable()
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map({ (email) -> ValidationStatus in
                let valid = self.emailValidator.validate(email: email)
                return ValidationStatus(bool: valid)
            })
    }
    
    var phoneValidation: Observable<ValidationStatus> {
        return phone.asObservable()
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map({ (phone) -> ValidationStatus in
                let valid = self.phoneValidator.validate(phone: phone)
                return ValidationStatus(bool: valid)
            })
    }
    
    var cnpjValidation: Observable<ValidationStatus> {
        return cnpj.asObservable()
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map({ (cnpj) -> ValidationStatus in
                let valid = self.cnpjValidator.validate(cnpj: cnpj)
                return ValidationStatus(bool: valid)
            })
    }
    
    var businessNameValidation: Observable<ValidationStatus> {
        return businessName.asObservable()
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map({ (businessName) -> ValidationStatus in
                let valid = businessName.isEmpty ? false : true
                return ValidationStatus(bool: valid)
            })
    }
    
    // MARK: - State tracker -
    
//    enum PresentationState {
//        case inProgress
//        case readyToRegister
//
//        init(ready: Bool) {
//            ready ? (self = .readyToRegister) : (self = .inProgress)
//        }
//    }
//
//    private var isNameValid = false {
//        didSet {
//            presentationState = PresentationState(ready: validateAllFields())
//        }
//    }
//    private var isEmailValid = false {
//        didSet {
//            presentationState = PresentationState(ready: validateAllFields())
//        }
//    }
//
//    private var isPhoneValid = false {
//        didSet {
//            presentationState = PresentationState(ready: validateAllFields())
//        }
//    }
//
//    private var isCNPJValid = false {
//        didSet {
//            presentationState = PresentationState(ready: validateAllFields())
//        }
//    }
//
//    private var isBusinessNameValid = false {
//        didSet {
//            presentationState = PresentationState(ready: validateAllFields())
//        }
//    }
//
//    private var presentationState = PresentationState.inProgress
    
    // MARK: - Initializer -
    
    init(headlinesDataSource: RetrieveHeadlines, nameValidator: NameValidator, emailValidator: EmailValidator, phoneValidator: PhoneValidator, cnpjValidator: CNPJValidator, customerFormatter: CustomerFormatter) {
        self.headlinesDataSource = headlinesDataSource
        self.nameValidator = nameValidator
        self.emailValidator = emailValidator
        self.phoneValidator = phoneValidator
        self.cnpjValidator = cnpjValidator
        self.customerFormatter = customerFormatter
    }
    
}

// MARK: - Public API -

extension RegisterViewModel {
    
    func getHeadlines() -> Headlines {
        return headlinesDataSource.getHeadlines()
    }
    
//    mutating func fullNameChanged(newName: String) -> ValidationStatus {
//        isNameValid = nameValidator.validate(name: newName)
//        return ValidationStatus(bool: isNameValid, enableButton: validateAllFields(), description: "Entre com nome e sobrenome")
//    }
//
//    mutating func emailChanged(newEmail: String) -> ValidationStatus {
//        isEmailValid = emailValidator.validate(email: newEmail)
//        return ValidationStatus(bool: isEmailValid, enableButton: validateAllFields(), description: "Entre com um email válido")
//    }
//
//    mutating func phoneChanged(newPhone: String) -> ValidationStatus {
//        isPhoneValid = phoneValidator.validate(phone: newPhone)
//        return ValidationStatus(bool: isPhoneValid, enableButton: validateAllFields(), description: "Entre com um telefone válido")
//    }
//
//    mutating func cnpjChanged(newCNPJ: String) -> ValidationStatus {
//        isCNPJValid = cnpjValidator.validate(cnpj: newCNPJ)
//        return ValidationStatus(bool: isCNPJValid, enableButton: validateAllFields(), description: "Entre com um CNPJ válido")
//    }
//
//    mutating func businessNameChanged(newBusinessName: String) -> ValidationStatus {
//        isBusinessNameValid = newBusinessName.isEmpty ? false : true
//        return ValidationStatus(bool: isBusinessNameValid, enableButton: validateAllFields(), description: "Entre com o nome fantasia")
//    }
    
    mutating func register(customerInput: CustomerInput) -> ValidationStatus {
        
//        guard presentationState == .readyToRegister
//            else {
//                return .invalid(description: "Preencha todas as informações corretamente")
//        }
        
        let customer = customerFormatter.transformToDomainData(customerInput: customerInput)
        let customerData = customerFormatter.transformToDataModel(customer: customer)
        customerData.save()
        return .valid(enableButton: false)
    }
    
}

// MARK: - Private methods -

//private extension RegisterViewModel {
//    
//    func validateAllFields() -> Bool {
//        return isNameValid && isEmailValid && isPhoneValid && isCNPJValid && isBusinessNameValid
//    }
//    
//}

