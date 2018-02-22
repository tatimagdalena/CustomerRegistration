//
//  String.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 22/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

extension String {
    
    func removeNonDecimalDigits() -> String {
        return replacingOccurrences(of: "[^\\d+]", with: "", options: [.regularExpression])
    }
    
}
