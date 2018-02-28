//
//  DataBaseHeadlines.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 21/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

struct DataBaseHeadlines: RetrieveHeadlines {
    
    func getHeadlines() -> Headlines {
        
        generateHeadlines()
        
        let headlinesData = HeadlinesData.findFirst()!
        return transformToDomainData(headlinesData)
    }
    
    private func transformToDomainData(_ headlinesData: HeadlinesData) -> Headlines {
        return Headlines(fullName: headlinesData.name ?? "",
                         email: headlinesData.email ?? "",
                         phone: headlinesData.phone ?? "",
                         businessName: headlinesData.businessName ?? "",
                         cnpj: headlinesData.cnpj ?? "",
                         startDate: headlinesData.startDate ?? "",
                         isMei: headlinesData.isMei ?? "")
    }
    
    private func generateHeadlines() {
        
        if HeadlinesData.findFirst() != nil {
            return
        }
        
        let headlinesData = HeadlinesData.create()
        headlinesData.name = "Nome completo"
        headlinesData.email = "Email"
        headlinesData.phone = "Telefone para contato"
        headlinesData.businessName = "Nome fantasia"
        headlinesData.cnpj = "CNPJ"
        headlinesData.startDate = "Ativa desde"
        headlinesData.isMei = "É MEI?"
        headlinesData.save()
    }
    
}
