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
    
}
