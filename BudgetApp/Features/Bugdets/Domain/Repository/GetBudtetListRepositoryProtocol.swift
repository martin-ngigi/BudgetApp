//
//  GetBudtetListRepositoryProtocol.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

protocol GetBudtetListRepositoryProtocol {
    func getBudtetList() -> Result<[BudgetItemEntity], CoreDataError>
}
