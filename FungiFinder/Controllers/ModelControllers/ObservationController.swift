//
//  ObservationController.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/2/21.
//

import CoreData

class ObservationController {
    
    static let shared = ObservationController()
    var observations: [Observation] = []
    let privateDB = CKContainer.default().privateCloudDatabase
    
    private lazy var fetchRequest: NSFetchRequest<Observation> = {
        let request = NSFetchRequest<Observation>(entityName: "Observation")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - CRUD
    
    func createObservation(with name: String, date: Date, image: Data, notes: String, reminder: Date, type: String, latitude: String, longitude: String) {
        let observation = Observation(date: date, image: image, latitude: latitude, longitude: longitude, name: name, notes: notes, reminder: reminder, type: type)
        observations.append(observation)
    }
    
    
    
    
    
    
    
    
    
}// End of Class
