//
//  CustomInputField.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation
import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    
    var body: some View {
        VStack(spacing: 5){
            Text("Item name")
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(Color.theme.blackAndWhite)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                                  
                /*
                  ZStack(alignment: .leading) {
                      if  viewModel.username.isEmpty {
                          Text("Username")
                              .foregroundColor(.white)
                          }
                          TextField("", text:  $text)
                              .autocapitalization(.none)
                              .foregroundColor(.white)
                              .padding(.vertical, 9)
                  }
                */
                  
                  TextField(placeholder, text: $text)
                      .autocapitalization(.none)
                      //.foregroundColor(.white)
                      .padding(.vertical, 7)

              }
              .padding(.horizontal, 10)
              .padding(.vertical, 5)
              .background(Color.clear)
              .overlay(
                  RoundedRectangle(cornerRadius: 6)
                      .stroke(Color.gray, lineWidth: 1)
              )
        }
        
    }
}

#Preview {
    CustomInputField(text: .constant(""), title: "title", placeholder: "Placeholder here")
}
