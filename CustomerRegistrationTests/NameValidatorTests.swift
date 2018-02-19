//
//  NameValidatorTests.swift
//  DataValitation-MVPTests
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class NameValidatorTests: XCTestCase {
    
    var validatorUnderTest: NameValidator!
    
    override func setUp() {
        super.setUp()
        validatorUnderTest = NameValidator()
    }
    
    override func tearDown() {
        validatorUnderTest = nil
        super.tearDown()
    }
    
    func testEmptyStringIsInvalid() {
        
        // given
        let name = ""
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beFalse())
        
    }
    
    func testNoLastnameIsInvalid() {
        
        // given
        let name = "Fulano"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beFalse())
        
    }
    
    func testNoFirstNameIsInvalid() {
        
        // given
        let name = " Silva"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beFalse())
        
    }
    
    func testMinimumCharactersAmount() {
        
        // given
        let name = "Ab C"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beFalse(), description: "Less than 3 characters is valid when it shouldn't be.")
        
    }
    
    func testMaximumCharactersAmount() {
        
        // given
        let name = "Fulano de Tal da Silva Sauro Orleans e Braganca Souza Martins"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beFalse(), description: "More than 60 characters is valid when it shouldn't be.")
    }
    
    func testValidNameAndLastname() {
        
        // given
        let name = "Fulano Sauro"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        expect(validationResponse).to(beTrue(), description: "A valid name is being checked as invalid.")
    }
    
}
