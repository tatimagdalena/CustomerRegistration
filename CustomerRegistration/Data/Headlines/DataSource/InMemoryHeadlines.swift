//
//  InMemoryHeadlines.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 19/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct InMemoryHeadlines: RetrieveHeadlines {
    
    static var headlines = Headlines(fullName: "Nome completo", email: "Email", phone: "Telefone para contato", businessName: "Nome fantasia", cnpj: "CNPJ", startDate: "Ativa desde", isMei: "É MEI?")
    
    func getHeadlines() -> Headlines {
        return InMemoryHeadlines.headlines
    }
    
}
