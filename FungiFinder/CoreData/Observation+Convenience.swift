//
//  Observation+Convenience.swift
//  FungiFinder
//
//  Created by Kyle Warren on 8/30/21.
//

import CoreData
import UIKit

extension Observation {
    convenience init(date: Date, image: Data?, latitude: String?, longitude: String?, name: String, notes: String?, reminder: Date?, type: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.date = date
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.notes = notes
        self.reminder = reminder
        self.type = type
    }
} // End of Extension
