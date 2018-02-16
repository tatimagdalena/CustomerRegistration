//
//  DataBaseContacts.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 16/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct DataBaseContacts: RetrieveContacts {
    
    func getCustomersList() -> [Customer] {
        var customers = [Customer]()
        let customersData = CustomerData.findAll() as! [CustomerData]
        for customerData in customersData {
            let customer = transformToDomainData(customerData: customerData)
            customers.append(customer)
        }
        return customers
    }
    
    private func transformToDomainData(customerData: CustomerData) -> Customer {
        let fullName = "\(customerData.name ?? "-") \(customerData.lastName ?? "-")"
        let companyData = customerData.company
        let startDate = companyData?.startDate as Date?
        let company = Company(businessName: companyData?.businessName ?? "-", cnpj: companyData?.cnpj ?? "-", startDate: startDate ?? Date(), mei: companyData?.mei ?? false)
        return Customer(fullName: fullName, email: customerData.email ?? "-", phone: customerData.phone ?? "-", company: company)
    }
}
