//
//  ColorTheme.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import Foundation

import SwiftUI

struct ColorTheme {
    let greenColorDark = Color("GreenColorDark")
    let greenColorYellowish = Color("GreenColorYellowish")
    let whiteAndBlack = Color("WhiteAndBlack")
    let blackAndWhite = Color("BlackAndWhite")
}

extension Color {
    static var theme = ColorTheme()
}
