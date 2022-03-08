//
//  HistoryView.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import SwiftUI

struct HistoryView: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Journal")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Journal")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
