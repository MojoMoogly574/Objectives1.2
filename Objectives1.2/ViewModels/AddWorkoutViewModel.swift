//
//  AddWorkoutViewModel.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation


class AddWorkoutViewModel: ObservableObject {
    
  
    var workoutName: String = ""
    var workoutDescrip: String = ""
    @Published var priority: String = ""
    var dueDate: Date = Date()
    
    func save() {
        
        let workout = Workout(context: Workout.viewContext)
        workout.workoutName = workoutName
        workout.workoutDescrip = workoutDescrip
        workout.priority = priority
        
        try? workout.save()
    }
}
