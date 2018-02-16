//
//  CustomerListViewModel.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 09/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct CustomerListViewModel {
    
    private let contactsDataSource: RetrieveContacts
    private let customerFormatter: CustomerFormatter
    
    init(contactsDataSource: RetrieveContacts, customerFormatter: CustomerFormatter) {
        self.contactsDataSource = contactsDataSource
        self.customerFormatter = customerFormatter
    }
    
    mutating func getCustomers() -> Result<[CustomerViewData]> {
        let customers = contactsDataSource.getCustomersList()
        if customers.isEmpty {
            return .empty
        }
        else {
            var customersViewData = [CustomerViewData]()
            for customer in customers {
                customersViewData.append(customerFormatter.transformToViewData(customer: customer))
            }
            return .withValue(customersViewData)
        }
    }
    
}
