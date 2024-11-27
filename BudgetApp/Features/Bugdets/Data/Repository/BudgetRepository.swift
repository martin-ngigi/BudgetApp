//
//  BudgetRepository.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation


struct BudgetRepository: InsertBudgetListItemsRepositoryProtocol, GetBudtetListRepositoryProtocol{
    
    static let shared = BudgetRepository()
    let budgetItemsLocalDataSource = BudgetItemsLocalDataSource()
    
    func insertBudgetListItems(itemList: [BudgetItemEntity], budgetItem: BudgetItemEntity) -> Result<Double, CoreDataError> {
        let result = budgetItemsLocalDataSource.insertBudgetListItems(itemList: itemList, budgetItem: budgetItem)
        
        switch result {
        case .success(let budgetCount):
            return .success(budgetCount)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getBudtetList() -> Result<[BudgetItemEntity], CoreDataError> {
        let budgetListResult: Result<[BudgetItemsCoreData], CoreDataError> = budgetItemsLocalDataSource.getBudtetList()
        switch budgetListResult {
        case .success(let budgetListSwiftData):
            let budgetListEntites: [BudgetItemEntity] = budgetListSwiftData.map{ cartItemSwiftData in
                return BudgetItemEntity(coreData: cartItemSwiftData)!
            }
            return .success(budgetListEntites)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    
}
