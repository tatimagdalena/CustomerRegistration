//
//  PhoneValidatorTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class PhoneValidatorTests: XCTestCase {
    
    var validatorUnderTests: PhoneValidator!
    
    override func setUp() {
        super.setUp()
        validatorUnderTests = PhoneValidator()
    }
    
    override func tearDown() {
        validatorUnderTests = nil
        super.tearDown()
    }
    
    func assertFalseValidation(phone: String, caller: String) {
        let validationResponse = validatorUnderTests.validate(phone: phone)
        expect(validationResponse).to(beFalse(), description: "In \(caller)")
    }
    
    func assertTrueValidation(phone: String, caller: String) {
        let validationResponse = validatorUnderTests.validate(phone: phone)
        expect(validationResponse).to(beTrue(), description: "In \(caller)")
    }
    
    func testEmptyStringIsInvalid() {
        let phone = ""
        assertFalseValidation(phone: phone, caller: #function)
    }
    
    func testFewerDigitsIsInvalid() {
        let phone = "219876543"
        assertFalseValidation(phone: phone, caller: #function)
    }
    
    func testMoreDigitsIsInvalid() {
        let phone = "219876543210"
        assertFalseValidation(phone: phone, caller: #function)
    }
    
    func testInvalidCharacter() {
        let phone = "21987654a32"
        assertFalseValidation(phone: phone, caller: #function)
    }
    
    func testInvalidBeggining() {
        let phone = "21908765432"
        assertFalseValidation(phone: phone, caller: #function)
    }
    
    func testValidEightDigits() {
        let phone = "2122222222"
        assertTrueValidation(phone: phone, caller: #function)
    }
    
    func testValidNineDigits() {
        let phone = "21987654321"
        assertTrueValidation(phone: phone, caller: #function)
    }
    
}
