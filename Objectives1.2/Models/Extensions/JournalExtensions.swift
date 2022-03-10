//
//  JournalExtensions.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import CoreData

extension Journal: BaseModel {
    
    static func getjournalEntriesByWorkoutId(workoutId: NSManagedObjectID) -> [Journal] {
        
        let request: NSFetchRequest<Journal> = Journal.fetchRequest()
        request.predicate = NSPredicate(format: "workout = %@", workoutId)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
}
