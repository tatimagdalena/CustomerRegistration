//
//  CustomerDetailsViewModel.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 22/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct CustomerDetailsViewModel {
    
    // MARK: - Contributors -
    private let headlinesDetailsDataSource: RetrieveDetailsHeadlines
    private let customerDataSource: RetrieveContacts
    private let customerFormatter: CustomerFormatter
    
    // MARK: - Properties -
    private let customerId: String
    
    // MARK: - Initializer -
    init(headlinesDetailsDataSource: RetrieveDetailsHeadlines, customerDataSource: RetrieveContacts, customerId: String, customerFormatter: CustomerFormatter) {
        self.headlinesDetailsDataSource = headlinesDetailsDataSource
        self.customerDataSource = customerDataSource
        self.customerId = customerId
        self.customerFormatter = customerFormatter
    }
    
}

// MARK: - Public API -

extension CustomerDetailsViewModel {
    
    func getDetails() -> Result<DetailsOutput> {
        do {
            let headlinesDetails = headlinesDetailsDataSource.getDetailsHeadlines()
            let customer = try customerDataSource.getCustomer(with: customerId)
            let detailsOutput = customerFormatter.merge(headlines: headlinesDetails, customer: customer)
            return .withValue(detailsOutput)
        } catch {
            return .empty
        }
    }
    
    func deleteCustomer(with email: String) -> ValidationStatus {
        let success = customerDataSource.deleteCustomer(with: email)
        return ValidationStatus(bool: success)
    }
}
