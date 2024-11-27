//
//  SimpleDropDownMenu.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

import SwiftUI

struct SimpleDropDownMenu: View {
    var title: String
    var prompt: String
    var options: [String]
    @Binding var selection: String
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            Text(title)
                .font(.system(size: 17, weight: .regular, design: .rounded))
                
            
            VStack(alignment: .leading, spacing: 0) {
                Picker(selection: $selection, label: Text(prompt)) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                            .foregroundColor(Color.theme.blackAndWhite)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .foregroundColor(Color.theme.blackAndWhite)
                
                Divider()
                    .frame(height: 1.5)
                    .background(Color.theme.blackAndWhite)
            }
            
            /*
            Button(action: {
                isExpanded.toggle()
            }) {
                HStack {
                    Text(selection.isEmpty ? prompt : selection)
                        .foregroundColor(selection.isEmpty ? .secondary : .primary)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selection = option
                            isExpanded = false
                        }) {
                            Text(option)
                        }
                    }
                }
                .padding(.top, 8)
            }
            Divider()
                .frame(height: 1.5)
                .background(Color.theme.blackAndWhite)
            */
            
        }
    }
}

struct SimpleDropDownMenu_Previews: PreviewProvider {
    @State static var selectedOption = "Option 1"
    
    static var previews: some View {
        SimpleDropDownMenu(
            title: "Select an Option",
            prompt: "Please select",
            options: ["Option 1", "Option 2", "Option 3"],
            selection: $selectedOption
        )
    }
}
