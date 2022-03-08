//
//  SettingsView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import SwiftUI

struct SettingsView: View {
        
        var body: some View{
            
            NavigationView{
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .navigationTitle("Settings")
            }
        }
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
