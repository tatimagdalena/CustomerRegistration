//
//  RetrieveHeadlinesTests.swift
//  CustomerRegistrationTests
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class RetrieveHeadlinesTests: XCTestCase {
    
    var headlinesRetrieverUnderTest: RetrieveHeadlines!
    
    override func setUp() {
        super.setUp()
        headlinesRetrieverUnderTest = InMemoryHeadlines()
    }
    
    override func tearDown() {
        headlinesRetrieverUnderTest = nil
        super.tearDown()
    }
    
    func testHeadlinesRetrieval() {
        let headlines = headlinesRetrieverUnderTest.getHeadlines()
        expect(headlines.fullName).to(equal("Nome completo"))
        expect(headlines.email).to(equal("Email"))
        expect(headlines.phone).to(equal("Telefone para contato"))
        expect(headlines.businessName).to(equal("Nome fantasia"))
        expect(headlines.cnpj).to(equal("CNPJ"))
        expect(headlines.startDate).to(equal("Ativa desde"))
        expect(headlines.isMei).to(equal("É MEI?"))
    }
}
