//
//  Observation+Convenience.swift
//  FungiFinder
//
//  Created by Kyle Warren on 8/30/21.
//

import CoreData
import UIKit
import MapKit

extension Observation: MKAnnotation {
    convenience init(date: Date, image: UIImage?, latitude: String?, longitude: String?, name: String, notes: String?, reminder: Date?, type: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.date = date
        self.image = image?.jpegData(compressionQuality: 0.3)
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.notes = notes
        self.reminder = reminder
        self.type = type
        self.id = UUID()
    }

        public var coordinate: CLLocationCoordinate2D {
            guard let latitude = latitude, let longitude = longitude else {
                return kCLLocationCoordinate2DInvalid
            }
            
            let latDegrees = CLLocationDegrees(latitude) ?? 0.0
            let longDegrees = CLLocationDegrees(longitude) ?? 0.0
            return CLLocationCoordinate2D(latitude: latDegrees, longitude: longDegrees)
        }
    }// End of Extension
