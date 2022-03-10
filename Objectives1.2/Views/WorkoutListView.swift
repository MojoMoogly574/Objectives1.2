//
//  WorkoutListView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addWorkout
   // case showFilters
}




struct WorkoutListView: View {
    
    @StateObject private var workoutVM = WorkoutListViewModel()
    @State private var activeSheet: Sheets?
    @State private var filterApplied: Bool = false
    
    private func deleteWorkout(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let workout = workoutVM.workouts[index]
            // delete the workout
            workoutVM.deleteWorkout(workout: workout)
            // get all workouts
            workoutVM.getAllWorkouts()
        }
    }
    
    var body: some View {
    
            VStack {
                List {
                    
                    ForEach(workoutVM.workouts, id: \.workoutId) { workout in
                        NavigationLink(
                            destination: WorkoutDetail(),
                            label: {
                                WorkoutCell(workout: workout)
                            })
                    }.onDelete(perform: deleteWorkout)
                    
                }.listStyle(PlainListStyle())
                
                .navigationTitle("Workouts")
                .navigationBarItems(trailing: Button("Add Workout") {
                    activeSheet = .addWorkout
                        })
                .sheet(item: $activeSheet, onDismiss: {
// Opening for search function
                    if(!filterApplied) {
                        workoutVM.getAllWorkouts()
                    }
                    }, content: { item in
                        switch item {
                            case .addWorkout:
                                AddWorkoutView()
                            
                        }
                    })
                .onAppear(perform: {
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().separatorColor = .clear
                    workoutVM.getAllWorkouts()
            })
            }.embedInNavigationView()
        }
    }


struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutListView()
        }
    }
}


