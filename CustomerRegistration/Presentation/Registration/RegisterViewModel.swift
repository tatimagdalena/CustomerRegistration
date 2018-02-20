//
//  RegisterViewModel.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct RegisterViewModel {
    
    private let headlinesDataSource: RetrieveHeadlines
    
    private let nameValidator: NameValidator
    private let emailValidator: EmailValidator
    private let phoneValidator: PhoneValidator
    private let cnpjValidator: CNPJValidator
    
    private var isNameValid = false
    private var isEmailValid = false
    private var isPhoneValid = false
    private var isCNPJValid = false
    
    init(headlinesDataSource: RetrieveHeadlines, nameValidator: NameValidator, emailValidator: EmailValidator, phoneValidator: PhoneValidator, cnpjValidator: CNPJValidator) {
        self.headlinesDataSource = headlinesDataSource
        self.nameValidator = nameValidator
        self.emailValidator = emailValidator
        self.phoneValidator = phoneValidator
        self.cnpjValidator = cnpjValidator
    }
    
    func getHeadlines() -> Result<Headlines> {
        let headlines = headlinesDataSource.getHeadlines()
        if headlines.fullName.isEmpty {
            return .empty
        }
        else {
            return .withValue(headlines)
        }
    }
    
    mutating func fullNameChanged(newName: String) -> ValidationStatus {
        isNameValid = nameValidator.validate(name: newName)
        return ValidationStatus(bool: isNameValid, enableButton: validateAllFields(), description: "Entre com nome e sobrenome")
    }
    
    mutating func emailChanged(newEmail: String) -> ValidationStatus {
        isEmailValid = emailValidator.validate(email: newEmail)
        return ValidationStatus(bool: isEmailValid, enableButton: validateAllFields(), description: "Entre com um email válido")
    }
    
    mutating func phoneChanged(newPhone: String) -> ValidationStatus {
        isPhoneValid = phoneValidator.validate(phone: newPhone)
        return ValidationStatus(bool: isPhoneValid, enableButton: validateAllFields(), description: "Entre com um telefone válido")
    }
    
    mutating func cnpjChanged(newCNPJ: String) -> ValidationStatus {
        isCNPJValid = cnpjValidator.validate(cnpj: newCNPJ)
        return ValidationStatus(bool: isCNPJValid, enableButton: validateAllFields(), description: "Entre com um CNPJ válido")
    }
    
    private func validateAllFields() -> Bool {
        return isNameValid && isEmailValid && isPhoneValid && isCNPJValid
    }
    
}
