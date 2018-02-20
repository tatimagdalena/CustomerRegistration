//
//  CNPJValidatorTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class CNPJValidatorTests: XCTestCase {
    
    var validatorUnderTest: CNPJValidator!
    
    override func setUp() {
        super.setUp()
        validatorUnderTest = CNPJValidator()
    }
    
    override func tearDown() {
        validatorUnderTest = nil
        super.tearDown()
    }
    
    func testEmptyStringIsInvalid() {
        let cnpj = ""
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beFalse())
    }
    
    func testFewerDigitsIsInvalid() {
        let cnpj = "7349428000109"
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beFalse())
    }
    
    func testMoreDigitsIsInvalid() {
        let cnpj = "87349428000109"
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beFalse())
    }
    
    func testNoNumberDigitsIsInvalid() {
        let cnpj = "7349428a00109"
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beFalse())
    }
    
    func testFalsePositiveIsInvalid() {
        let cnpj = "88888888888888"
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beFalse())
    }
    
    func testValidDocumentNumber() {
        let cnpj = "73439428000109"
        let validationResponse = validatorUnderTest.validate(cnpj: cnpj)
        expect(validationResponse).to(beTrue())
    }
}
