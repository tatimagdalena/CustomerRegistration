// MARK: - Mocks generated from file: CustomerRegistration/Presentation/CustomerFormatter.swift at 2018-03-02 13:54:53 +0000

//
//  CustomerFormatter.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 15/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Cuckoo
@testable import CustomerRegistration

import Foundation


// MARK: - Mocks generated from file: CustomerRegistration/Presentation/CustomerDetails/CustomerDetailsViewModel.swift at 2018-03-02 13:54:53 +0000

//
//  CustomerDetailsViewModel.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 22/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Cuckoo
@testable import CustomerRegistration

import Foundation


// MARK: - Mocks generated from file: CustomerRegistration/Data/Headlines/DataSource/RetrieveDetailsHeadlines.swift at 2018-03-02 13:54:53 +0000

//
//  RetrieveDetailsHeadlines.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 27/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Cuckoo
@testable import CustomerRegistration

import Foundation

class MockRetrieveDetailsHeadlines: RetrieveDetailsHeadlines, Cuckoo.Mock {
    typealias MocksType = RetrieveDetailsHeadlines
    typealias Stubbing = __StubbingProxy_RetrieveDetailsHeadlines
    typealias Verification = __VerificationProxy_RetrieveDetailsHeadlines
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: RetrieveDetailsHeadlines?

    func spy(on victim: RetrieveDetailsHeadlines) -> Self {
        observed = victim
        return self
    }

    

    

    
    // ["name": "getDetailsHeadlines", "returnSignature": " -> DetailsHeadlines", "fullyQualifiedName": "getDetailsHeadlines() -> DetailsHeadlines", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "DetailsHeadlines", "isOptional": false, "stubFunction": "Cuckoo.StubFunction"]
     func getDetailsHeadlines()  -> DetailsHeadlines {
        
            return cuckoo_manager.call("getDetailsHeadlines() -> DetailsHeadlines",
                parameters: (),
                original: observed.map { o in
                    return { (args) -> DetailsHeadlines in
                        let () = args
                        return o.getDetailsHeadlines()
                    }
                })
        
    }
    

    struct __StubbingProxy_RetrieveDetailsHeadlines: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func getDetailsHeadlines() -> Cuckoo.StubFunction<(), DetailsHeadlines> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("getDetailsHeadlines() -> DetailsHeadlines", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_RetrieveDetailsHeadlines: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func getDetailsHeadlines() -> Cuckoo.__DoNotUse<DetailsHeadlines> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("getDetailsHeadlines() -> DetailsHeadlines", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class RetrieveDetailsHeadlinesStub: RetrieveDetailsHeadlines {
    

    

    
     func getDetailsHeadlines()  -> DetailsHeadlines {
        return DefaultValueRegistry.defaultValue(for: DetailsHeadlines.self)
    }
    
}




// MARK: - Mocks generated from file: CustomerRegistration/Data/Contacts/DataSource/RetrieveContacts.swift at 2018-03-02 13:54:53 +0000

//
//  RetrieveContacts.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Cuckoo
@testable import CustomerRegistration

import Foundation

class MockRetrieveContacts: RetrieveContacts, Cuckoo.Mock {
    typealias MocksType = RetrieveContacts
    typealias Stubbing = __StubbingProxy_RetrieveContacts
    typealias Verification = __VerificationProxy_RetrieveContacts
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: RetrieveContacts?

    func spy(on victim: RetrieveContacts) -> Self {
        observed = victim
        return self
    }

    

    

    
    // ["name": "getCustomersList", "returnSignature": " -> [Customer]", "fullyQualifiedName": "getCustomersList() -> [Customer]", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "[Customer]", "isOptional": false, "stubFunction": "Cuckoo.StubFunction"]
     func getCustomersList()  -> [Customer] {
        
            return cuckoo_manager.call("getCustomersList() -> [Customer]",
                parameters: (),
                original: observed.map { o in
                    return { (args) -> [Customer] in
                        let () = args
                        return o.getCustomersList()
                    }
                })
        
    }
    
    // ["name": "getCustomer", "returnSignature": " throws -> Customer", "fullyQualifiedName": "getCustomer(with: String) throws -> Customer", "parameterSignature": "with email: String", "parameterSignatureWithoutNames": "email: String", "inputTypes": "String", "isThrowing": true, "isInit": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "email", "call": "with: email", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("with"), name: "email", type: "String", range: CountableRange(280..<298), nameRange: CountableRange(280..<284))], "returnType": "Customer", "isOptional": false, "stubFunction": "Cuckoo.StubThrowingFunction"]
     func getCustomer(with email: String)  throws -> Customer {
        
            return try cuckoo_manager.callThrows("getCustomer(with: String) throws -> Customer",
                parameters: (email),
                original: observed.map { o in
                    return { (args) throws -> Customer in
                        let (email) = args
                        return try o.getCustomer(with: email)
                    }
                })
        
    }
    
    // ["name": "deleteCustomer", "returnSignature": " -> Bool", "fullyQualifiedName": "deleteCustomer(with: String) -> Bool", "parameterSignature": "with email: String", "parameterSignatureWithoutNames": "email: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "email", "call": "with: email", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("with"), name: "email", type: "String", range: CountableRange(343..<361), nameRange: CountableRange(343..<347))], "returnType": "Bool", "isOptional": false, "stubFunction": "Cuckoo.StubFunction"]
     func deleteCustomer(with email: String)  -> Bool {
        
            return cuckoo_manager.call("deleteCustomer(with: String) -> Bool",
                parameters: (email),
                original: observed.map { o in
                    return { (args) -> Bool in
                        let (email) = args
                        return o.deleteCustomer(with: email)
                    }
                })
        
    }
    

    struct __StubbingProxy_RetrieveContacts: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func getCustomersList() -> Cuckoo.StubFunction<(), [Customer]> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("getCustomersList() -> [Customer]", parameterMatchers: matchers))
        }
        
        func getCustomer<M1: Cuckoo.Matchable>(with email: M1) -> Cuckoo.StubThrowingFunction<(String), Customer> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: email) { $0 }]
            return .init(stub: cuckoo_manager.createStub("getCustomer(with: String) throws -> Customer", parameterMatchers: matchers))
        }
        
        func deleteCustomer<M1: Cuckoo.Matchable>(with email: M1) -> Cuckoo.StubFunction<(String), Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: email) { $0 }]
            return .init(stub: cuckoo_manager.createStub("deleteCustomer(with: String) -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_RetrieveContacts: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func getCustomersList() -> Cuckoo.__DoNotUse<[Customer]> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("getCustomersList() -> [Customer]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getCustomer<M1: Cuckoo.Matchable>(with email: M1) -> Cuckoo.__DoNotUse<Customer> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: email) { $0 }]
            return cuckoo_manager.verify("getCustomer(with: String) throws -> Customer", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func deleteCustomer<M1: Cuckoo.Matchable>(with email: M1) -> Cuckoo.__DoNotUse<Bool> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: email) { $0 }]
            return cuckoo_manager.verify("deleteCustomer(with: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class RetrieveContactsStub: RetrieveContacts {
    

    

    
     func getCustomersList()  -> [Customer] {
        return DefaultValueRegistry.defaultValue(for: [Customer].self)
    }
    
     func getCustomer(with email: String)  throws -> Customer {
        return DefaultValueRegistry.defaultValue(for: Customer.self)
    }
    
     func deleteCustomer(with email: String)  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}



