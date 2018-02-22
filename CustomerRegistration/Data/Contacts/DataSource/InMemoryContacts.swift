//
//  InMemoryContacts.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct InMemoryContacts: RetrieveContacts {
    
    static var customers = [Customer]()
    
    func getCustomersList() -> [Customer] {
        return InMemoryContacts.customers
    }
    
    func getCustomer(with email: String) throws -> Customer {
        guard let wantedCustomer = InMemoryContacts.customers.first(where: { $0.email == email }) else {
            throw ContactsRetrievalError.nonexistent
        }
        return wantedCustomer
    }
    
    func deleteCustomer(with email: String) -> Bool {
        let customerIndex = InMemoryContacts.customers.index { $0.email == email }
        if let index = customerIndex {
            InMemoryContacts.customers.remove(at: index)
            return true
        }
        return false
    }
}
