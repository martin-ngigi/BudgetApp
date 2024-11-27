//
//  BudgetItemEntity.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

struct BudgetItemEntity : Codable{
    var itemId: String
    var productName: String
    var price: Double
    var currency: String
    
    
    init(id: String, productName: String, price: Double, currency: String) {
        self.itemId = id
        self.productName = productName
        self.price = price
        self.currency = currency
    }
    
    init?(coreData: BudgetItemsCoreData){
        self.itemId = coreData.itemId ?? ""
        self.productName = coreData.productName ?? ""
        self.price = coreData.price ?? 0.0
        self.currency = coreData.currency ?? ""
    }
    
}
