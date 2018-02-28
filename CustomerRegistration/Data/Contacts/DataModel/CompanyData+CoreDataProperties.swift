//
//  CompanyData+CoreDataProperties.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 16/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//
//

import Foundation
import CoreData


extension CompanyData {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyData> {
//        return NSFetchRequest<CompanyData>(entityName: "CompanyData")
//    }

    @NSManaged public var businessName: String?
    @NSManaged public var cnpj: String?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var mei: Bool
    @NSManaged public var owner: CustomerData?

}
