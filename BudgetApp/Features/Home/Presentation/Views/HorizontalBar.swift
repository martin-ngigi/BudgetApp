//
//  HorizontalBar.swift
//  BudgetApp
//
//  Created by Martin Wainaina on 27/11/2024.
//

import SwiftUI


struct HorizontalBar: View {
    let data: [Double]
    
    // Generate a random color for each segment
    var colors: [Color] {
        data.map { _ in
            Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1)
            )
        }
    }
    
    var normalizedData: [Double] {
        let total = data.reduce(0, +)
        return data.map { $0 / total }
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(0..<data.count, id: \.self) { index in
                        Rectangle()
                            .fill(colors[index])
                            .frame(width: geometry.size.width * CGFloat(normalizedData[index]))
                            .padding(.horizontal, 2)
                            .cornerRadius(7)
                    }
                }
                .frame(height: 20)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .cornerRadius(7)
            }
            .frame(height: 20)
            
            /*
            // Display data values and their fractions
            VStack(alignment: .leading) {
                let total = data.reduce(0, +)
                ForEach(0..<data.count, id: \.self) { index in
                    HStack {
                        Text("Value: \(data[index], specifier: "%.1f")")
                        Spacer()
                        Text("Fraction: \(normalizedData[index] * 100, specifier: "%.2f")%")
                    }
                }
                Text("Total: \(total, specifier: "%.1f")")
                    .fontWeight(.bold)
                    .padding(.top, 5)
            }
            .padding(.horizontal)
            */
        }
    }
}



#Preview {
    HorizontalBar(data: [40.0, 20.0, 30.0, 10.0])
}
