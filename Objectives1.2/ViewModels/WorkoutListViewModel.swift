//
//  WorkoutListViewModel.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import CoreData

class WorkoutListViewModel: ObservableObject{
    
    @Published var workouts = [WorkoutViewModel]()
    
    func deleteWorkout(workout: WorkoutViewModel) {
        let workout: Workout? = Workout.byId(id: workout.workoutId)
        if let workout = workout {
            try? workout.delete()
        }
    }
    
    func getAllWorkouts() {
        DispatchQueue.main.async {
            self.workouts = Workout.all().map(WorkoutViewModel.init)
        }
    }
}

struct WorkoutViewModel {
    
    let workout: Workout
    
    var workoutId: NSManagedObjectID {
        return workout.objectID
    }
    
    var workoutName: String {
        return workout.workoutName ?? ""
    }
    
    var workoutDescrip: String {
        return workout.workoutDescrip ?? "Not available"
    }
    
    var dueDate: String? {
        return workout.dueDate?.asFormattedString()
    }
    
    var priority: String? {
        return workout.priority ?? ""
    }
}

