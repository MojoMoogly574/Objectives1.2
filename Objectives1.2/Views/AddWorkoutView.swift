//
//  AddWorkoutView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @State private var priority: String = "Strength"
    @StateObject  var addWorkoutVM = AddWorkoutViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    let priorities = ["Cardio","Strength","Power","Recover"]
    
    var body: some View {
        
        Form{
            Section(header: Text("WORKOUT DETAILS")) {
            TextField("Enter name of workout", text: $addWorkoutVM.workoutName)
            TextField("Enter brief description", text: $addWorkoutVM.workoutDescrip)
                //Picker for workout type
            }
                Section(header: Text("WORKOUT TYPE:")) {
             
                Picker("Type:", selection: $priority) {
                    ForEach(priorities, id:\.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                        .foregroundColor(.blue)
    
                }
                
            Section(header: Text("WORKOUT DATE")) {
                DatePicker("Due:", selection: $addWorkoutVM.dueDate)
            }
                Spacer()
                
                VStack {
                    
                    Button("Save") {
                        addWorkoutVM.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                   
                }
             
        }
        .navigationTitle("Add Workout")
                               .embedInNavigationView()
        }
        
        
}
       

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}
