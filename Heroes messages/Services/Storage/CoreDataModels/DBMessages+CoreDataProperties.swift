//
//  DBMessages+CoreDataProperties.swift
//  Heroes messages
//
//  Created by Кирилл on 16.05.2022.
//
//

import Foundation
import CoreData


extension DBMessages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBMessages> {
        return NSFetchRequest<DBMessages>(entityName: "DBMessages")
    }

    @NSManaged public var text: String?
    @NSManaged public var type: Bool
    @NSManaged public var id: String?
    @NSManaged public var created: Date?

}

extension DBMessages : Identifiable {

}
