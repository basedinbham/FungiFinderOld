//
//  CoreDataStack.swift
//  FungiFinder
//
//  Created by Kyle Warren on 8/30/21.
//

import CoreData

 class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentCloudKitContainer = {
        
        let container = NSPersistentCloudKitContainer(name: "FungiFinder")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        let context = CoreDataStack.shared.container.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }
    
    static func saveContext() {
        if context.hasChanges {
            do{
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
} // End of enum

