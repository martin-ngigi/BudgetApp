//
//  DashboardView.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        
        TabView(selection: $dashboardViewModel.activeTab) {
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                        Text("Home")
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                    }
                }
                .tag(TabIdentifier.home)
            
            BudgetView()
                .tabItem {
                    VStack{
                        Image(systemName: "square.grid.2x2")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                        Text("Budgets")
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                    }
                }
                .tag(TabIdentifier.budgets)
            
            Text("Add Shortcut")
                .tabItem {
                    VStack{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.theme.greenColorDark)
                            .background(Color.theme.greenColorDark)
                            .accentColor(Color.green) // Sets the selected tab color
                        
                    }
                }
            
            ReportsView()
                .tabItem {
                    VStack{
                        Image(systemName: "chart.bar.xaxis")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                        Text("Reports")
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                    }
                }
                .tag(TabIdentifier.reports)
            
            AccountsView()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                        Text("Account")
                            .foregroundColor(dashboardViewModel.activeTab == TabIdentifier.home ? Color.green : Color.gray)
                    }
                }
                .tag(TabIdentifier.accounts)

            }
        .accentColor(Color.green) // Sets the selected tab color

    }
}

#Preview {
    DashboardView()
}
