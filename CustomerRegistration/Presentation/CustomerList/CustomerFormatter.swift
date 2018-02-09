//
//  CustomerFormatter.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 15/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct CustomerFormatter {
    
    func transformToViewData(customer: Customer) -> CustomerViewData {
        let caption = generateCaption(text: customer.company.businessName)
        return CustomerViewData(owner: customer.fullName, company: customer.company.businessName, companyInitials: caption)
    }
    
    private func generateCaption(text: String) -> String {
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
    
}
