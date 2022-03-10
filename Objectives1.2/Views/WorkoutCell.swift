//
//  WorkoutCell.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import SwiftUI

struct WorkoutCell: View {
        
        let workout: WorkoutViewModel
        
        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(workout.workoutName)
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                    Text(workout.workoutDescrip)
                        .font(.callout)
                        .opacity(0.5)
                    Text(workout.dueDate ?? "")
                        .font(.callout)
                        .opacity(0.8)
                    Spacer()
                    
                }
                Spacer()
                HStack {
                    Text(workout.priority ?? "Unkown")
                      .font(.footnote)
                      .foregroundColor(Color(UIColor.systemGray2))
                      .padding(3)
                      .frame(minWidth: 62)
                      .overlay(
                        Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75))
                }
            }
            .padding()
            .foregroundColor(Color.black)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
        }
    }

struct WorkoutCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
