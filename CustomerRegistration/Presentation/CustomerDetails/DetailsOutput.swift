//
//  DetailsOutput.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 22/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct DetailsOutput {
    let information: [(title: String, value: String)]
}

extension DetailsOutput {
    init() {
        information = []
    }
}
