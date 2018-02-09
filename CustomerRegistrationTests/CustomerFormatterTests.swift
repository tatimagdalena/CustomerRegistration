//
//  CustomerFormatterTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 15/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

@testable import CustomerRegistration
import XCTest
import Nimble

class CustomerFormatterTests: XCTestCase {
    
    private func assertCustomerViewData(_ object: CustomerViewData, expected: CustomerViewData, caller: String) {
        expect(object.companyInitials).to(equal(expected.companyInitials), description: "In \(caller)")
        expect(object.company).to(equal(expected.company), description: "In \(caller)")
        expect(object.owner).to(equal(expected.owner), description: "In \(caller)")
    }
    
    func test_Translation_OneWordBusinessName() {
        
        let company = Company(businessName: "Lojinha", cnpj: "56588798", startDate: Date(), mei: false)
        let customer = Customer(fullName: "Fulano da Silva", email: "me@domain.com", phone: "2199999999", company: company)
        let customerViewData = CustomerFormatter().transformToViewData(customer: customer)
        
        let expectedCustomerViewData = CustomerViewData(owner: "Fulano da Silva", company: "Lojinha", companyInitials: "L")
        
        assertCustomerViewData(customerViewData, expected: expectedCustomerViewData, caller: #function)
    }
    
    func test_Translation_MoreThanThreeWordsBussinessName() {
        let company = Company(businessName: "Lojinha Escondida No Meio Do Nada", cnpj: "56588798", startDate: Date(), mei: false)
        let customer = Customer(fullName: "Fulano da Silva", email: "me@domain.com", phone: "2199999999", company: company)
        let customerViewData = CustomerFormatter().transformToViewData(customer: customer)
        
        let expectedCustomerViewData = CustomerViewData(owner: "Fulano da Silva", company: "Lojinha Escondida No Meio Do Nada", companyInitials: "LEN")
        
        assertCustomerViewData(customerViewData, expected: expectedCustomerViewData, caller: #function)
    }
    
}
