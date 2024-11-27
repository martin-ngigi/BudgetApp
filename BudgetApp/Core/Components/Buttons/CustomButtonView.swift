//
//  CustomButtonView.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

import SwiftUI

struct CustomButtonView: View {
    var buttonName: String
//    var width: Double = (UIScreen.main.bounds.width - 40)
    var width: Double = .infinity
    var height: Double = 48
    var leadingIcon: String=""
    var leadingimage: String=""
    var icon: String=""
    var image: String=""
    var foregroundStyle: Color = Color.theme.blackAndWhite
    var backgroundColor: Color = Color.theme.greenColorYellowish
    var borderColor: Color = Color.theme.greenColorYellowish
    var buttonNameColor: Color = Color.theme.blackAndWhite
    var isDisabled: Bool = false
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                if(!leadingIcon.isEmpty){
                    Image(systemName: leadingIcon)
                }
                
                if(!leadingimage.isEmpty){
                    Image(leadingimage)
                }
                
                Text(buttonName)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(buttonNameColor)
                
                if(!icon.isEmpty){
                    Image(systemName: icon)
                }
                
                if(!image.isEmpty){
                    Image(image)
                }
                
            }
            .foregroundColor(foregroundStyle)
            .frame(maxWidth: width, maxHeight: height)
            .frame(height: height) // Solve the maxHeight issue
        }
        .background(isDisabled ? Color.gray : backgroundColor)
        .disabled(isDisabled)
        .cornerRadius(7)
        .overlay(
               RoundedRectangle(cornerRadius: 7)
                   .stroke(borderColor, lineWidth: 1)
           )


    }
}

#Preview {
    CustomButtonView(buttonName: "ButtonName", icon: "arrow.right") {
        print("You clicked CustomButtonView")
    }
}
