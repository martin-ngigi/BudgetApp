//
//  DashboardViewModel.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

class DashboardViewModel: ObservableObject{
    @Published var activeTab = TabIdentifier.home
    @Published var isNavigateToBudgetSuccessView = false

}
