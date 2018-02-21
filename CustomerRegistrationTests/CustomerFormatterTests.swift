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
    
    func test_TranslationToDomain_MaskedCNPJ() {
        let date = Date()
        let customerInput = CustomerInput(fullName: "Fulano da Silva", email: "me@domain.com", phone: "2122222222", businessName: "Loja de Lá", cnpj: "38.894.986/0001-63", startDate: date, isMei: false)
        let customer = CustomerFormatter().transformToDomainData(customerInput: customerInput)
        expect(customer.company.cnpj).to(equal("38894986000163"))
    }
    
    func test_TranslationToDomain_MaskedPhone() {
        let date = Date()
        let customerInput = CustomerInput(fullName: "Fulano da Silva", email: "me@domain.com", phone: "(21)2222-2222", businessName: "Loja de Lá", cnpj: "38.894.986/0001-63", startDate: date, isMei: false)
        let customer = CustomerFormatter().transformToDomainData(customerInput: customerInput)
        expect(customer.phone).to(equal("2122222222"))
    }
    
}
