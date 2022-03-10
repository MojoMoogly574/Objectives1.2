//
//  ExerciseListViewModel.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import CoreData

class ExerciseListViewModel: ObservableObject {
    
    @Published var exercises = [ExerciseViewModel]()
    
    func getExercisesByWorkout(vm: WorkoutViewModel) {
        DispatchQueue.main.async {
            self.exercises = Exercise.getExercisesByWorkoutId(workoutId: vm.workoutId).map(ExerciseViewModel.init)
        }
    }
}

struct ExerciseViewModel {
    
    let exercise: Exercise
    
    var exerciseId: NSManagedObjectID {
        return exercise.objectID
    }
    
    var exerciseName: String {
        return exercise.exerciseName ?? ""
    }
    
    var workouts: [WorkoutViewModel] {
        return Workout.byExerciseName(name: exerciseName).map(WorkoutViewModel.init)
    }
}
