//
//  SideMenuView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/7/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            // Profile Pic...
            Image("profile")
                .resizable()
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(.white, lineWidth: 5))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 7)
        
            // Padding top for Top Close Button...
                .padding(.top,50)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text("Emily")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {}, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
            })
            
            // tab Buttons...
            VStack(alignment: .leading,spacing: 10){
                
                TabButtonView(image: "house", title: "Workouts", selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "clock.arrow.circlepath", title: "Journal", selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "bell.badge", title: "Notifications", selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "gearshape.fill", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading,-15)
            .padding(.top,50)
            
            Spacer()
            
            // Sign Out Button...
            VStack(alignment: .leading, spacing: 6, content: {
                
                TabButtonView(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading,-15)
                
                Text("App Version 1.2.0")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .opacity(0.6)
            })
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
