//
//  RegisterViewModelTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class RegisterViewModelTests: XCTestCase {
    
    var viewModelUnderTests: RegisterViewModel!
    
    override func setUp() {
        super.setUp()
        viewModelUnderTests = RegisterViewModel(headlinesDataSource: InMemoryHeadlines(),
                                                nameValidator: NameValidator(),
                                                emailValidator: EmailValidator(),
                                                phoneValidator: PhoneValidator(),
                                                cnpjValidator: CNPJValidator(),
                                                customerFormatter: CustomerFormatter())
    }
    
    override func tearDown() {
        viewModelUnderTests = nil
        super.tearDown()
    }
    
    func test_InvalidNameChange() {
        let status = viewModelUnderTests.fullNameChanged(newName: "Ab C")
        expect(status).to(equal(ValidationStatus.invalid(description: "Entre com nome e sobrenome")))
    }
    
    func test_InvalidEmailChange() {
        let status = viewModelUnderTests.emailChanged(newEmail: "mail.domain.com")
        expect(status).to(equal(ValidationStatus.invalid(description: "Entre com um email válido")))
    }
    
    func test_InvalidCNPJChange() {
        let status = viewModelUnderTests.cnpjChanged(newCNPJ: "45689")
        expect(status).to(equal(ValidationStatus.invalid(description: "Entre com um CNPJ válido")))
    }
    
    func test_InvalidPhoneChange() {
        let status = viewModelUnderTests.phoneChanged(newPhone: "0000000000")
        expect(status).to(equal(ValidationStatus.invalid(description: "Entre com um telefone válido")))
    }
    
    func test_ValidNameChange_ButtonDisabled() {
        let status = viewModelUnderTests.fullNameChanged(newName: "Fulano Silva")
        expect(status).to(equal(ValidationStatus.valid(enableButton: false)))
    }
    
    func test_ValidEmailChange_ButtonDisabled() {
        let status = viewModelUnderTests.emailChanged(newEmail: "mail@domain.com")
        expect(status).to(equal(ValidationStatus.valid(enableButton: false)))
    }
    
    func test_ValidPhoneChange_ButtonDisabled() {
        let status = viewModelUnderTests.phoneChanged(newPhone: "21987654321")
        expect(status).to(equal(ValidationStatus.valid(enableButton: false)))
    }
    
    func test_ValidCNPJChange_ButtonDisabled() {
        let status = viewModelUnderTests.cnpjChanged(newCNPJ: "73439428000109")
        expect(status).to(equal(ValidationStatus.valid(enableButton: false)))
    }
    
    func test_AllValidFields_ButtonEnabled() {
        let nameStatus = viewModelUnderTests.fullNameChanged(newName: "Fulano Silva")
        let emailStatus = viewModelUnderTests.emailChanged(newEmail: "mail@domain.com")
        let phoneStatus = viewModelUnderTests.phoneChanged(newPhone: "21987654321")
        let cnpjStatus = viewModelUnderTests.cnpjChanged(newCNPJ: "73439428000109")
        let businessNameStatus = viewModelUnderTests.businessNameChanged(newBusinessName: "Uma Loja")
        expect(nameStatus).to(equal(ValidationStatus.valid(enableButton: false)))
        expect(emailStatus).to(equal(ValidationStatus.valid(enableButton: false)))
        expect(phoneStatus).to(equal(ValidationStatus.valid(enableButton: false)))
        expect(cnpjStatus).to(equal(ValidationStatus.valid(enableButton: false)))
        expect(businessNameStatus).to(equal(ValidationStatus.valid(enableButton: true)))
    }
    
}
