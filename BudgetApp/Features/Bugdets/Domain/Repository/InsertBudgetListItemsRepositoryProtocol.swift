//
//  InsertBudgetListItemsRepositoryProtocol.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

protocol InsertBudgetListItemsRepositoryProtocol {
    func insertBudgetListItems(itemList: [BudgetItemEntity], budgetItem: BudgetItemEntity) -> Result<Double, CoreDataError>

}
