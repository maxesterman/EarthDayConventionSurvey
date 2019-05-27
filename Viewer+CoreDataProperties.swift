//
//  Viewer+CoreDataProperties.swift
//  EarthDayConventionSurvey
//
//  Created by Max Sterman on 4/11/17.
//  Copyright © 2017 Max Sterman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Viewer {

    @NSManaged var lectureSatNumber: NSNumber?
    @NSManaged var lectureViewingExperienceNumber: NSNumber?
    @NSManaged var lectureLength: NSNumber?
    @NSManaged var comments: String?
    @NSManaged var activities: String?
    @NSManaged var gender: String?
    


}
