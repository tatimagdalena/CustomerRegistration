//
//  ValidationStatus.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

enum ValidationStatus {
    case valid(enableButton: Bool)
    case invalid(description: String)
    
    init(bool: Bool, enableButton: Bool = false, description: String = "") {
        if bool {
            self = .valid(enableButton: enableButton)
        }
        else {
            self = .invalid(description: description)
        }
    }
}

extension ValidationStatus: Equatable {
    static func ==(lhs: ValidationStatus, rhs: ValidationStatus) -> Bool {
        switch (lhs, rhs) {
        case (let .valid(leftButtonBool), let .valid(rightButtonBool)): return leftButtonBool == rightButtonBool
        case (let .invalid(leftMessage), let .invalid(rightMessage)): return leftMessage == rightMessage
        default:
            return false
        }
    }
}
