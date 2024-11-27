//
//  BudgetItemRow.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

struct BudgetItemRow: View {
    var color: Color
    var title: String
    var currency: String
    var price: String
    
    var body: some View {
        HStack{
            Image(systemName: "circle.fill")
                .frame(width: 40, height: 40)
                .foregroundColor(color)
            
            
            Text(title)
                .font(.system(size: 17, weight: .light, design: .rounded))
                .padding(.leading, 10)
            
            Spacer()
            
            Text("\(currency) \(price)")
                .font(.system(size: 17, weight: .light, design: .rounded))
                .padding(.leading, 10)

        }
    }
}


#Preview {
    BudgetItemRow(color: .red, title: "Title one", currency: "KES", price: "100.00")
}
