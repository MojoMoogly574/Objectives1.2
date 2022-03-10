//
//  ViewExtensions.swift
//  Objectives1.2
//
//  Created by Joseph DeWeese on 3/8/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
