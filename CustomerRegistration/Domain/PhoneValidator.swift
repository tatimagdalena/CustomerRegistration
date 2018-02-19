//
//  PhoneValidator.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct PhoneValidator {
    
    private let phoneRegex = "[1-9]{2}(?:[2-8]|9[1-9])[0-9]{3}[0-9]{4}"
    
    func validate(phone: String) -> Bool {
        let phoneTest = NSPredicate(format: "SELF MATCHES[c] %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
}
