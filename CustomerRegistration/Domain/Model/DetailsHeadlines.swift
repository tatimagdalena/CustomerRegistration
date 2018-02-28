//
//  DetailsHeadlines.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 27/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct DetailsHeadlines {
    let businessName: String
    let cnpj: String
    let startDate: String
    let isMei: String
    let owner: String
    let email: String
    let phone: String
}

extension DetailsHeadlines {
    init() {
        owner = ""
        email = ""
        phone = ""
        businessName = ""
        cnpj = ""
        startDate = ""
        isMei = ""
    }
}
