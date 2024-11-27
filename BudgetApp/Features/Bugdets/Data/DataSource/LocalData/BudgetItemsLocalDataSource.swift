//
//  BudgetItemsLocalDataSource.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

import CoreData

class BudgetItemsLocalDataSource {
    
    private let viewContext = CoreDataProvider.shared.persistentContainer.viewContext

    func insertBudgetListItems(itemList: [BudgetItemEntity], budgetItem: BudgetItemEntity) -> Result<Double, CoreDataError>{
        
        var itemsTotal : Double = 0
        for (index, itemEntity) in itemList.enumerated() {
            itemsTotal = itemsTotal + itemEntity.price
        }
        
        let budgetCoreData = BudgetItemsCoreData(context: viewContext)
        budgetCoreData.itemId = budgetItem.itemId
        budgetCoreData.price = budgetItem.price
        budgetCoreData.currency = budgetItem.currency
        budgetCoreData.productName = budgetItem.productName
 
        // save
        do {
            try viewContext.save()
        }
        catch {
            print("DEBUG: Failed to save with error \(error.localizedDescription)")
            return .failure(CoreDataError.custom("\(error.localizedDescription)"))
        }
        
        return .success(itemsTotal)
    }
    
    func clearBudgetList(){
        var budgetItemList: [BudgetItemsCoreData] = []
        let getBudgetListResult = getBudtetList()
        
        switch getBudgetListResult {
        case .success(let listResults):
            budgetItemList = listResults
        case .failure(let error):
            print("DEBUG: Error clearing Budget \(error)")
        }
        
        deleteBudgetList( budgetList: budgetItemList)
    }

    
    func deleteBudgetList( budgetList: [BudgetItemsCoreData]){
        for budgetItem in budgetList {
            viewContext.delete(budgetItem)
        }
        save()
    }
    
    func deleteAllBudgetList( ){
        let request = BudgetItemsCoreData.fetchRequest()
        do {
            
            let budgetList: [BudgetItemsCoreData] = try viewContext.fetch(request)
            for budgetItem in budgetList {
                viewContext.delete(budgetItem)
            }
            save()
        }
        catch {
            print("DEBUG: Failed to load budget items with error \(error.localizedDescription)")
        }
        
    }
        
    func deleteBudgetItem(productId: String){
        var budgetItemList: [BudgetItemsCoreData] = []
        let getBudgetListResult = getBudtetList()
        
        switch getBudgetListResult {
        case .success(let budgetListResults):
            budgetItemList = budgetListResults
        case .failure(let error):
            print("DEBUG: Error deleteBudgetItem \(error)")
        }
        
        guard let specificBudgetItem = budgetItemList.first(where: { $0.itemId == productId }) else {
            print("DEBUG: deleteBudgetItem \(productId) not found")
            return
        }
        
        viewContext.delete(specificBudgetItem)
        save()
        
    }
    
    func getBudtetList() -> Result<[BudgetItemsCoreData], CoreDataError> {
        
        let request = BudgetItemsCoreData.fetchRequest()
        do {
            let items: [BudgetItemsCoreData] = try viewContext.fetch(request)
            return .success(items)
        }
        catch {
            print("DEBUG: Failed to load Budget items with error \(error.localizedDescription)")
            return .failure(CoreDataError.custom("\(error.localizedDescription)"))
        }
    }
    
    func hasBudgetItemWithBudgetId(itemId: String) -> Result<Bool, CoreDataError> {
        var productExists: Bool = false
        var getBudgetListResult = getBudtetList()
        
        switch getBudgetListResult {
        case .success(let budgetListResults):
            productExists = budgetListResults.contains(where: { itemInList -> Bool in
                return itemInList.itemId == itemId
            })
            return .success(productExists)
        case .failure(let error):
            return .failure(CoreDataError.custom("\(error.localizedDescription)"))
        }
        

    }
    
    func getBudgetItem(itemId: String) -> Result<BudgetItemsCoreData?, CoreDataError> {
        // get specific budget item
        let budgetItemListResults = getBudtetList()
        switch budgetItemListResults {
        case .success(let itemsResults):
            guard let specificBudgetItem = itemsResults.first(where: { $0.itemId == itemId }) else {
                print("DEBUG: getBudgetItem item found with BudgetId \(itemId)")
                return .failure(CoreDataError.dataNotFound)
            }
            
            return .success(specificBudgetItem)
        case .failure(let error):
            return .failure(CoreDataError.custom("\(error.localizedDescription)"))
        }
        

    }
   
    private func save() {
        do {
            try viewContext.save()
        }
        catch {
            print("DEBUG: Failed to save with error \(error.localizedDescription)")
        }
    }
}
