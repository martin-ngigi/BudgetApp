//
//  BudgetViewModel.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation
class BudgetViewModel: ObservableObject{
    let budgetUseCases = BudgetUseCases(insertBudgetListItemsRepository: BudgetRepository.shared, getBudtetListRepository: BudgetRepository.shared)
    
    @Published var budgetItemList: [BudgetItemEntity] = []
    
    func insertBudgetItem(
        name: String,
        price: Double,
        currency: String,
        itemsList: [BudgetItemEntity]
    ){
        let item = BudgetItemEntity(
            id: UUID().description,
            productName: name,
            price: price,
            currency: currency
        )
        
        let results  = budgetUseCases.executeInsertBudgetListItems(itemList: itemsList, budgetItem: item)
    }
    
    func getBudtetList() -> [BudgetItemEntity] {
        let results = budgetUseCases.executeGetBudtetList()
        switch results {
        case .success(let itemsList):
            budgetItemList = itemsList
            print("DEBUG: List is \(budgetItemList)")
            return itemsList
        case .failure(let error):
            print("DEBUG: getBudtetList failed with error \(error.description) ")
            return []
        }
    }
    
    func getTotal(
        itemsList: [BudgetItemEntity]
    ) -> Double{
        var total = 0.0
        for item in itemsList{
            total = total + item.price
        }
        return total
    }
    
    func getBarItems(itemsList: [BudgetItemEntity]) -> [Double] {
        var barItems: [Double] = []
        
        for item in itemsList {
            barItems.append(item.price) // Append the price to the barItems array
        }
        
        print("DEBUG: Bar items are \(barItems)")
        
        return barItems // Return the populated array
    }
}
