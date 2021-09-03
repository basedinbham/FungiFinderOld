//
//  NSManagedObjectContext.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/2/21.
//
//
//import CoreData
//
//extension NSManagedObjectContext {
//    func saveContext() {
//        do {
//            try save()
//        } catch {
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }
//    }
//
//    func delete(_ observations: [Observation]) {
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Observation")
//        request.predicate = NSPredicate(format: "id IN %@", observations.map { $0.id?.uuidString })
//        do {
//        let results = (try fetch(request) as? [Observation]) ?? []
//            results.forEach { delete($0) }
//        } catch {
//            print("Failied deleting provided objects")
//            return
//        }
//        saveContext()
//    }
//}
