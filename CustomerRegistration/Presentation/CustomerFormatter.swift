//
//  CustomerFormatter.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 15/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct CustomerFormatter {
    
    func transformToOutputData(customer: Customer) -> CustomerOutput {
        let caption = generateCaption(text: customer.company.businessName)
        return CustomerOutput(owner: customer.fullName,
                                company: customer.company.businessName,
                                companyInitials: caption,
                                customerId: customer.email)
    }
    
    func transformToDataModel(customer: Customer) -> CustomerData {
        let customerData = CustomerData.create()
        var allNames = customer.fullName.components(separatedBy: " ")
        customerData.name = allNames.remove(at: 0)
        customerData.lastName = allNames.joined(separator: " ")
        customerData.email = customer.email
        customerData.phone = customer.phone
        
        let company = customer.company
        let companyData = CompanyData.create()
        companyData.businessName = company.businessName
        companyData.cnpj = company.cnpj
        companyData.startDate = company.startDate as NSDate
        companyData.mei = company.mei
        
        customerData.company = companyData
        
        return customerData
    }
    
    func transformToDomainData(customerInput: CustomerInput) -> Customer {
        let company = Company(businessName: customerInput.businessName,
                              cnpj: customerInput.cnpj.removeNonDecimalDigits(),
                              startDate: customerInput.startDate,
                              mei: customerInput.isMei)
        let customer = Customer(fullName: customerInput.fullName,
                                email: customerInput.email,
                                phone: customerInput.phone.removeNonDecimalDigits(),
                                company: company)
        return customer
    }
    
    func merge(headlines: DetailsHeadlines, customer: Customer) -> DetailsOutput {
        
        var information = [(title: String, value: String)]()
        information.append((title: headlines.businessName, value: customer.company.businessName))
        information.append((title: headlines.cnpj, value: customer.company.cnpj))
        information.append((title: headlines.startDate, value: detailFormattedDate(from: customer.company.startDate)))
        information.append((title: headlines.isMei, value: customer.company.mei.description))
        information.append((title: headlines.owner, value: customer.fullName))
        information.append((title: headlines.email, value: customer.email))
        information.append((title: headlines.phone, value: customer.phone))
        
        return DetailsOutput(information: information)
    }
    
}

// MARK: - Private methods -

private extension CustomerFormatter {
    
    func generateCaption(text: String) -> String {
        var result: String = ""
        var components = text.components(separatedBy: " ")
        if components.count > 3 {
            components.removeSubrange(3..<components.count)
        }
        for component in components {
            if let firstLetter = component.first {
                result.append(firstLetter)
            }
        }
        return result
    }
    
    func detailFormattedDate(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
}
