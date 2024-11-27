//
//  HomeView.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI

struct HomeView: View {
    //let barData = [40.0, 20.0, 30.0, 10.0]
    @StateObject var viewModel = BudgetViewModel()
    @State var budgetItemList: [BudgetItemEntity] = []
    
    @State var total = 0.0
    @State var barItems: [Double] = []
    
    var prompt: String = ""
    var options: [String] = ["JAN", "FEB", "MARCH", "APRIL", "JUNE", "JULY", "AUG", "SEP", "OCT", "NOV", "DEC"]
    @State var selectionCurrency: String = "JUNE"
    @State private var isExpanded = false
    
    // Generate a random color for each segment
    var colors: [Color] {
        barItems.map { _ in
            Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1)
            )
        }
    }

    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack{
                    ZStack {
                        // Background color
                        Color.white.ignoresSafeArea()
                                
                        // Gradient card
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors:[
                                                               Color.theme.greenColorYellowish,
                                                               //Color.theme.greenColorYellowish.opacity(0.5),
                                                               Color.theme.greenColorDark.opacity(0.5),
                                                               Color.theme.greenColorDark,
                                                    
                                                               ]
                                                      ),
                                            startPoint: .bottomLeading,
                                            endPoint: .topTrailing
                                        )
                                    )
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            //.shadow(radius: 5) // Optional shadow for depth
                        
                        VStack(spacing: 10){
                                HStack(alignment: .bottom){
                                    Text("\(Int(total))")
                                        .font(.system(size: 40, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.theme.whiteAndBlack)
                                    
                                    Text("ksh.")
                                        .font(.system(size: 17, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.theme.whiteAndBlack)
                                    
                                }
                                
                                Text("Remaining on your monthly budget.")
                                    .font(.system(size: 17, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.theme.whiteAndBlack)
                            }
                    }
                    
                    VStack{
                        VStack(spacing: 10){
                            Text("Total Spend for this Month.")
                                .font(.system(size: 14, weight: .light, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.gray)
                                .padding(.top, 10)
                            
                            HStack{
                                Text("KES \(Int(total))")
                                    .font(.system(size: 25, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.theme.blackAndWhite)
                                
                                Spacer()
                                
//                                SelectFromView(title: "June") {
//                                    
//                                }
//                                .frame(width: 80, height: 30)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Picker(selection: $selectionCurrency, label: Text(prompt)) {
                                        ForEach(options, id: \.self) { option in
                                            Text(option).tag(option)
                                                .font(.system(size: 14, weight: .light, design: .rounded))
                                                .foregroundColor(Color.theme.blackAndWhite)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    .foregroundColor(Color.theme.blackAndWhite)
                                    
                                }
                                .padding(0)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            }
                            
                                
                            HorizontalBar(data: barItems, colors: colors)
                            
                            VStack(spacing: 0) {
                                ForEach(Array(budgetItemList.enumerated()), id: \.element.itemId) { index, item in
                                    BudgetItemRow(color: colors[index], title: item.productName, currency: item.currency, price: "\(item.price)")
                                        .padding(0) // Remove any default padding
                                        .background(Color.clear) // Optional: Set background to clear if needed
                                        .overlay(
                                            Text("\(index)") // Display the index (optional)
                                                .foregroundColor(.white) // Change color as needed
                                                .padding(4), // Add some padding around the index text
                                            alignment: .topLeading // Positioning of the index text
                                        )
                                }
                            }
                            
                            
                            
                            HStack{
                                Text("Recent Transactions")
                                    .font(.system(size: 17, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.theme.blackAndWhite)
                                
                                Spacer()
                                
                                HStack{
                                    Text("View all")
                                        .font(.system(size: 17, weight: .light, design: .rounded))
                                    
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                .foregroundColor(Color.theme.greenColorDark)

                            }
                            
                            RecentTransactionRow(title: "KFC Westlands", amount: "780.00", date: "June 10, 2024 3:10 pm", description: "Eating out")
                            
                            RecentTransactionRow(title: "Naivas Supermarket", amount: "1200.00", date: "Nov 08, 2023 5:15 pm", description: "Shopping")

                        }
                    }
                }
            }
            .onAppear{
                Task{
                    budgetItemList = viewModel.getBudtetList()
                    total = viewModel.getTotal(itemsList: budgetItemList)
                    barItems = viewModel.getBarItems(itemsList: budgetItemList)
                }
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                   Text("Welcome back Kibanju")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                   Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(Color.theme.greenColorDark)
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
