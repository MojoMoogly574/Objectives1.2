//
//  ExerciseExtensions.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import CoreData

extension Exercise: BaseModel {
    
    static func getExercisesByWorkoutId(workoutId: NSManagedObjectID)-> [Exercise] {
        guard let workout = Workout.byId(id:workoutId) as? Workout,
              let exercises = workout.exercises
            
        else {
            
            return []
            
        }
        
        return([exercises])  
    }
}
