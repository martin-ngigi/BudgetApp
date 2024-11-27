//
//  BudgetUseCases.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

struct BudgetUseCases{
    let insertBudgetListItemsRepository: InsertBudgetListItemsRepositoryProtocol
    let getBudtetListRepository: GetBudtetListRepositoryProtocol
    
    init(insertBudgetListItemsRepository: InsertBudgetListItemsRepositoryProtocol, getBudtetListRepository: GetBudtetListRepositoryProtocol) {
        self.insertBudgetListItemsRepository = insertBudgetListItemsRepository
        self.getBudtetListRepository = getBudtetListRepository
    }
    
    func executeInsertBudgetListItems(itemList: [BudgetItemEntity], budgetItem: BudgetItemEntity) -> Result<Double, CoreDataError> {
        return insertBudgetListItemsRepository.insertBudgetListItems(itemList: itemList, budgetItem: budgetItem)
    }
    
    func executeGetBudtetList() -> Result<[BudgetItemEntity], CoreDataError> {
        return getBudtetListRepository.getBudtetList()
    }
}
