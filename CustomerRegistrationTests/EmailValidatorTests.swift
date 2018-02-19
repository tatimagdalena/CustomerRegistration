//
//  EmailValidatorTests.swift
//  DataValitation-MVPTests
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class EmailValidatorTests: XCTestCase {
    
    var validatorUnderTest: EmailValidator!
    
    override func setUp() {
        super.setUp()
        validatorUnderTest = EmailValidator()
    }
    
    override func tearDown() {
        validatorUnderTest = nil
        super.tearDown()
    }
    
    func testEmptyStringIsInvalid() {
        
        // given
        let email = ""
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "An empty string is valid when it shouldn't be.")
    }
    
    func testDotAtBegginingIsInvalid() {
        
        // given
        let email = ".me@domain.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Dot at the beggining is valid when it shouldn't be.")
    }
    
    func testDotAtLocalPartEndIsInvalid() {
        
        // given
        let email = "me.@domain.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Dot at the end of local-part is valid when it shouldn't be.")
    }
    
    func testConsecutiveDotsIsInvalid() {
        
        // given
        let email = "me..surname@domain.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Having more than one consecutive dots is valid when it shouldn't be.")
    }
    
    func testMoreThanOneAtIsInvalid() {
        
        // given
        let email = "me.surname@domain@other.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Having more than one @ is valid when it shouldn't be.")
    }
    
    func testNoAtIsInvalid() {
        
        // given
        let email = "me.surname.domain.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Having more than one @ is valid when it shouldn't be.")
    }
    
    func testNoFinalPartIsInvalid() {
        
        // given
        let email = "me.surname@domain"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Having more than one @ is valid when it shouldn't be.")
    }
    
    func testInvalidCharacters() {
        
        // given
        let email1 = "me.surname+blabla@domain@other.com"
        let email2 = "me.surname @domain.com"
        let email3 = "me.\\surname@domain.com"
        
        //when
        let validationResponse1 = validatorUnderTest.validate(email: email1)
        let validationResponse2 = validatorUnderTest.validate(email: email2)
        let validationResponse3 = validatorUnderTest.validate(email: email3)
        
        //then
        expect(validationResponse1).to(beFalse(), description: "A character is valid when it shouldn't be.")
        expect(validationResponse2).to(beFalse(), description: "A character is valid when it shouldn't be.")
        expect(validationResponse3).to(beFalse(), description: "A character is valid when it shouldn't be.")
    }
    
    func testValidEmail() {
        
        // given
        let email = "me@domain.com"
        
        //when
        let validationResponse = validatorUnderTest.validate(email: email)
        
        //then
        expect(validationResponse).to(beTrue(), description: "A valid email is being checked as invalid.")
    }
    
}
