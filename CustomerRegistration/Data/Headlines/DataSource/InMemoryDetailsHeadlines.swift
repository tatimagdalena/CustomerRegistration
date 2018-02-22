//
//  InMemoryDetailsHeadlines.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 27/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct InMemoryDetailsHeadlines: RetrieveDetailsHeadlines {
    
    static var headlines = DetailsHeadlines(businessName: "Nome fantasia", cnpj: "CNPJ", startDate: "Ativa desde", isMei: "É MEI?", owner: "Proprietário", email: "Email", phone: "Telefone")
    
    func getDetailsHeadlines() -> DetailsHeadlines {
        return InMemoryDetailsHeadlines.headlines
    }
}
