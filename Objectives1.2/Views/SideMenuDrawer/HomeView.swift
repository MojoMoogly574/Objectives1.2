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
            WorkoutListView()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









