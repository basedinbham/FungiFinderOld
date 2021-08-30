//
//  Fungi+Convenience.swift
//  FungiFinder
//
//  Created by Kyle Warren on 8/30/21.
//

import CoreData
import UIKit

extension Mushroom {
    convenience init(name: String, image: Data?, hymeniumType: String, capShape: String, whichGills: String, stipeCharacter: String, sporePrintColor: String, howEdible: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.image = image
        self.hymeniumType = hymeniumType
        self.capShape = capShape
        self.whichGills = whichGills
        self.stipeCharacter = stipeCharacter
        self.sporePrintColor = sporePrintColor
        self.howEdible = howEdible
    }
} // End of Extension


