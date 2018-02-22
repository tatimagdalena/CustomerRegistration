//
//  RetrieveContacts.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

protocol RetrieveContacts {
    func getCustomersList() -> [Customer]
    func getCustomer(with email: String) throws -> Customer
    func deleteCustomer(with email: String) -> Bool
}
