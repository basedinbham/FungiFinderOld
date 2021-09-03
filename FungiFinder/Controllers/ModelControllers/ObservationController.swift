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
    let publicDB = CKContainer.default().publicCloudDatabase
    
    private lazy var fetchRequest: NSFetchRequest<Observation> = {
        let request = NSFetchRequest<Observation>(entityName: "Observation")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - CRUD
    
    func createObservation(with name: String, date: Date, notes: String, reminder: Date, type: String, latitude: String, longitude: String) {
        let observation = Observation(date: date, image: nil, latitude: latitude, longitude: longitude, name: name, notes: notes, reminder: reminder, type: type)
        observations.append(observation)
    }
    
    func fetchOBservations() {
        let observations = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.observations = observations
        CoreDataStack.saveContext()

    }
    
    
    
    
    
    
    
}// End of Class
