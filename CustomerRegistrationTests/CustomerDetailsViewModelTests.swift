//
//  CustomerDetailsViewModelTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 01/03/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble
@testable import CustomerRegistration

class CustomerDetailsViewModelTests: XCTestCase {
    
    private var contactsDataSourceMock: MockRetrieveContacts!
    private var headlinesDataSourceMock: MockRetrieveDetailsHeadlines!
    private var viewModelUnderTests: CustomerDetailsViewModel!
    
    private var customer: Customer!
    
    private var fakeValues = FakeValues()
    
    override func setUp() {
        super.setUp()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        fakeValues.startDate = dateFormatter.date(from: fakeValues.dateString)
        let company = Company(businessName: fakeValues.businessName, cnpj: fakeValues.cnpj, startDate: fakeValues.startDate, mei: fakeValues.mei)
        customer = Customer(fullName: fakeValues.fullName, email: fakeValues.email, phone: fakeValues.phone, company: company)
        
        contactsDataSourceMock = MockRetrieveContacts()
        headlinesDataSourceMock = MockRetrieveDetailsHeadlines()
        
        stub(contactsDataSourceMock) { (stub) in
            when(stub.getCustomer(with: "me@domain.com")).thenReturn(customer)
            when(stub.getCustomer(with: "")).thenThrow(ContactsRetrievalError.nonexistent)
        }
        
        stub(headlinesDataSourceMock) { (stub) in
            when(stub.getDetailsHeadlines()).thenReturn(DetailsHeadlines(businessName: fakeValues.businessNameTitle, cnpj: fakeValues.cnpjTitle, startDate: fakeValues.startDateTitle, isMei: fakeValues.isMeiTitle, owner: fakeValues.ownerTitle, email: fakeValues.emailTitle, phone: fakeValues.phoneTitle))
        }
    }
    
    override func tearDown() {
        contactsDataSourceMock = nil
        headlinesDataSourceMock = nil
        viewModelUnderTests = nil
        super.tearDown()
    }
    
    func test_GetDetails_NotFount() {
        viewModelUnderTests = CustomerDetailsViewModel(headlinesDetailsDataSource: InMemoryDetailsHeadlines(), customerDataSource:contactsDataSourceMock, customerId: "", customerFormatter: CustomerFormatter())
        let result = viewModelUnderTests.getDetails()
        
        switch result {
        case .empty:
            break
        case .withValue(let value):
            fail("Expected empty result, got \(value.information)")
        }
    }
    
    func test_GetDetails_ExistingCustomer() {
        viewModelUnderTests = CustomerDetailsViewModel(headlinesDetailsDataSource: InMemoryDetailsHeadlines(), customerDataSource:contactsDataSourceMock, customerId: "me@domain.com", customerFormatter: CustomerFormatter())
        let result = viewModelUnderTests.getDetails()
        switch result {
        case .withValue:
            break
        case .empty:
            fail("Couldn't find expected customer details")
        }
    }
    
}

extension CustomerDetailsViewModelTests {
    struct FakeValues {
        fileprivate let businessName = "Lojinha de Lá"
        fileprivate let cnpj = "123345"
        fileprivate var startDate: Date!
        fileprivate let dateString = "10/01/2018"
        fileprivate let mei = false
        fileprivate let fullName = "Fulano de Tal"
        fileprivate let email = "me@domain.com"
        fileprivate let phone = "2122222222"
        fileprivate let businessNameTitle = "Nome fantasia"
        fileprivate let cnpjTitle = "CNPJ"
        fileprivate let startDateTitle = "Ativa desde"
        fileprivate let isMeiTitle = "É MEI?"
        fileprivate let ownerTitle = "Proprietário"
        fileprivate let emailTitle = "Email"
        fileprivate let phoneTitle = "Telefone"
    }
}

