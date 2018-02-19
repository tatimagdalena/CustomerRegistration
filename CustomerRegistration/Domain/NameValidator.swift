//
//  NameValidator.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct NameValidator {
    
    func validate(name: String) -> Bool {
        
        let nameComponents = name.split(separator: " ")
        if nameComponents.count < 2 {
            return false
        }
        
        if name.count <= 4 || name.count > 60 {
            return false
        }
        
        return true
    }
    
}
