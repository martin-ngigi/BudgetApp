//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    @StateObject var dashboardViewModel = DashboardViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(dashboardViewModel)
        }
    }
}
