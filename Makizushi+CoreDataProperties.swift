//
//  Makizushi+CoreDataProperties.swift
//  SushiShop
//
//  Created by Dmitriy Eliseev on 04.04.2024.
//
//

import Foundation
import CoreData

@objc(Makizushi)
public class Makizushi: NSManagedObject {

}

extension Makizushi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Makizushi> {
        return NSFetchRequest<Makizushi>(entityName: "Makizushi")
    }

    @NSManaged public var rollDescription: String?
    @NSManaged public var rollImage: Data?
    @NSManaged public var rollPrise: Double
    @NSManaged public var rollTitle: String?
    @NSManaged public var rollWeight: Int16

}

extension Makizushi : Identifiable {

}
