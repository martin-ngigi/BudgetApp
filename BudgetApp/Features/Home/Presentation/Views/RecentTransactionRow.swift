//
//  RecentTransactionRow.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

struct RecentTransactionRow: View {
    var title: String
    var amount: String
    var date: String
    var description: String
    
    var body: some View {
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
            
            VStack{
                HStack{
                    Text(title)
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Text("KES \(amount)")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(Color.red)
                        .padding(.leading, 10)
                }
                
                HStack{
                    Text(date)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(Color.gray)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Text(description)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(Color.gray)
                        .padding(.leading, 10)
                }
            }
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


#Preview {
    RecentTransactionRow(title: "KFC Westlands", amount: "780.00", date: "June 10, 2024 3:10 pm", description: "Eating out")
}
