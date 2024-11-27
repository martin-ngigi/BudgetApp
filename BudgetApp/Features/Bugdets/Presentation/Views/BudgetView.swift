//
//  BudgetView.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

struct BudgetView: View {
    
    @State var itemName = ""
    @State var amount = ""
    
    var prompt: String = ""
    var options: [String] = ["KES", "USD", "GBP"]
    @State var selectionCurrency: String = "KES"
    @State private var isExpanded = false
    @StateObject var viewModel = BudgetViewModel()
    @State var budgetItemList: [BudgetItemEntity] = []
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                
                NavigationLink(destination:BudgetSuccessView(itemName: itemName, currency: selectionCurrency, amount: amount).navigationBarBackButtonHidden(), isActive: $dashboardViewModel.isNavigateToBudgetSuccessView) { EmptyView() }
                
                Text("Add New budget Item")
                    .font(.system(size: 22, weight: .medium, design: .rounded))
                    .foregroundColor(Color.theme.blackAndWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                CustomInputField(text: $itemName, title: "Add item", placeholder: "Food")
                
                VStack(alignment: .leading, spacing: 0) {

                    Text("Allocation")
                        .font(.system(size: 17, weight: .regular, design: .rounded))
                        
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack{
                            Picker(selection: $selectionCurrency, label: Text(prompt)) {
                                ForEach(options, id: \.self) { option in
                                    Text(option).tag(option)
                                        .foregroundColor(Color.theme.blackAndWhite)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(Color.theme.blackAndWhite)
                            
                            Divider()
                                .frame(width: 1)
                                .background(Color.gray)
                                .frame(height: 30)
                            
                            TextField("Enter allocated amount", text: $amount)
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                                    
                }

                
                Spacer()
                
                CustomButtonView(buttonName: "Create New Budget Item") {
                    Task{
                        viewModel.insertBudgetItem(
                            name: itemName,
                            price: Double(amount) ?? 0.0,
                            currency: selectionCurrency,
                            itemsList: budgetItemList
                        )
                        dashboardViewModel.isNavigateToBudgetSuccessView = true

                    }
                }
                .padding(.bottom, 30)
            }
            .onAppear{
                budgetItemList = viewModel.getBudtetList()
                itemName = ""
                amount = ""
                selectionCurrency = "KES"
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
}


#Preview {
    BudgetView()
}
