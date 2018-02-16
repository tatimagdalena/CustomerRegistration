//
//  CustomerData+CoreDataProperties.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 16/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//
//

import Foundation
import CoreData


extension CustomerData {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomerData> {
//        return NSFetchRequest<CustomerData>(entityName: "CustomerData")
//    }

    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var name: String?
    @NSManaged public var lastName: String?
    @NSManaged public var company: CompanyData?

}
