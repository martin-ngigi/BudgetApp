//
//  BudgetSuccessView.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

struct BudgetSuccessView: View {
    
    var itemName: String
    var currency: String
    var amount: String
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        VStack(spacing: 10){
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.theme.greenColorDark)
            
            Text("Budget Item added")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundColor(Color.theme.greenColorDark)
            
            Text("Budget Item has been added successfully.")
                .font(.system(size: 17, weight: .light, design: .rounded))
                .foregroundColor(Color.gray)
            
            Divider()
                .frame(height: 0.5)
                .background(Color.gray)
                .padding()
                .padding(.top, 15)
            
            HStack{
                Text("Budget Item Name")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                Text(itemName)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.gray)
                
            }
            
            HStack{
                Text("Amount")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                Text("\(currency) \(amount)")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.theme.greenColorDark)
                
            }
            
            HStack{
                Text("Date")
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                Text(Date().description)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                    .foregroundColor(Color.gray)

            }
            
            Spacer()
            
            CustomButtonView(buttonName: "Go back to Home", backgroundColor: Color.theme.greenColorDark, borderColor: Color.theme.greenColorDark) {
                dashboardViewModel.activeTab = .home
                dashboardViewModel.isNavigateToBudgetSuccessView = false
            }
            .padding(.bottom, 30)
            
            CustomButtonView(buttonName: "Rate your experience", backgroundColor: Color.clear, borderColor: Color.theme.greenColorDark, buttonNameColor: Color.theme.greenColorDark) {

            }
            
        
        }
        .toolbar{
            
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                         .imageScale(.large)
                }
            
            }
        }
        .padding()
    }
}

#Preview {
    BudgetSuccessView(itemName: "Test Name", currency: "KES", amount: "100")
}
