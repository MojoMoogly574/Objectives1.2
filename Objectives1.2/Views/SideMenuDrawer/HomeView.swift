//
//  HomeView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/7/22.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: String
    
    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        // Tab View With Tabs...
        TabView(selection: $selectedTab){
            
            // Views...
            WorkoutList()
                .tag("Workouts")
            
            HistoryView()
                .tag("Journal")
            
            SettingsView()
                .tag("Settings")
            
            HelpView()
                .tag("Help")
            
            NotificationsView()
                .tag("Notifications")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// All Sub Views....

struct WorkoutList: View {
    
    var body: some View{
        
        NavigationView{
            
            VStack(alignment: .leading,spacing: 20){
            
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Emily")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Money Woman, Social Philanthropist, Glamour Magazine top 10 Beautiful Woman of All Time, Intellectual.")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
            }
            .navigationTitle("Workout List")
        }
    }
}








