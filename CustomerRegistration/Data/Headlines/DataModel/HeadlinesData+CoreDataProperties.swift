//
//  HeadlinesData+CoreDataProperties.swift
//  CustomerRegistration
//
//  Created by Tatiana Magdalena on 21/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//
//

import Foundation
import CoreData


extension HeadlinesData {

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var businessName: String?
    @NSManaged public var cnpj: String?
    @NSManaged public var startDate: String?
    @NSManaged public var isMei: String?

}
