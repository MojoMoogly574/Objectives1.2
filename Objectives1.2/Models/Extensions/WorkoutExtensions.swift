//
//  WorkoutExtensions.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import CoreData

extension Workout: BaseModel {
   
    static func byWorkoutName(workoutName: String) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Workout.workoutName), workoutName)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    static func byDateRangeOrMinimumRating(lower: Date?, upper: Date?, minimumRating: Int?) -> [Workout] {
        
        var predicates: [NSPredicate] = []
        
        if let lower = lower, let upper = upper {
            
            let dateRangePredicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                                            #keyPath(Workout.dueDate),
                                                            lower as NSDate,
                                                            #keyPath(Workout.dueDate),
                                                            upper as NSDate)
            
            predicates.append(dateRangePredicate)
            
        } else if let minRating = minimumRating {
            
            let minRatingPredicate = NSPredicate(format: "%K >= %i", #keyPath(Workout.priority), minRating)
            predicates.append(minRatingPredicate)
        }
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    static func byDateRange(lower: Date, upper: Date) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                        #keyPath(Workout.dueDate),
                                        lower as NSDate,
                                        #keyPath(Workout.dueDate),
                                        upper as NSDate
        )
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    
    static func byDueDate(dueDate: Date) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@",#keyPath(Workout.dueDate), dueDate as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    static func byExerciseName(name: String) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "exercise.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}

