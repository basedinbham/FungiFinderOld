//
//  Fungi+Convenience.swift
//  FungiFinder
//
//  Created by Kyle Warren on 8/30/21.
//

import CoreData
import UIKit

extension Mushroom {
    convenience init(name: String, nickname: String?, image: UIImage?, hymeniumType: String, capShape: String, whichGills: String, stipeCharacter: String, sporePrintColor: String, howEdible: String, season: String, shroomDescription: String, substrate: String?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.nickname = nickname
        self.image = image?.jpegData(compressionQuality: 1.0)
        self.hymeniumType = hymeniumType
        self.capShape = capShape
        self.whichGills = whichGills
        self.stipeCharacter = stipeCharacter
        self.sporePrintColor = sporePrintColor
        self.howEdible = howEdible
        self.season = season
        self.shroomDescription = shroomDescription
        self.substrate = substrate
    }
} // End of Extension


