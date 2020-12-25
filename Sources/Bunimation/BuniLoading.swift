//
//  BuniLoading.swift
//  
//
//  Created by BARIS UYAR on 25.12.2020.
//

import SwiftUI

public struct BuniLoading: View {
    
    @State private var circleOffset: CGPoint = .init(x: 20, y: 20)
    @State private var rectHeight: CGFloat = 0
    @State private var rotationDegree: Double = 0
    public var circleColor: Binding<Color>
    
    public init(circleColor: Binding<Color>) {
        self.circleColor = circleColor
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(circleColor.wrappedValue)
                .offset(x: circleOffset.x, y: circleOffset.y)
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(circleColor.wrappedValue)
                .offset(x: -circleOffset.x, y: -circleOffset.y)
            Rectangle()
                .frame(width: 30, height: rectHeight)
                .foregroundColor(circleColor.wrappedValue)
                .cornerRadius(15)
                .offset(x: 20, y: -20)
            Rectangle()
                .frame(width: 30, height: rectHeight)
                .foregroundColor(circleColor.wrappedValue)
                .cornerRadius(15)
                .offset(x: -20, y: 20)
        }
        .rotationEffect(.degrees(rotationDegree))
        .onAppear {
            animate()
        }
    }
    
    private func animate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeIn(duration: 0.4)) {
                circleOffset.y = -20
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                rectHeight = 70
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            withAnimation(.easeInOut(duration: 0.4)) {
                rotationDegree = rotationDegree + 360
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                rectHeight = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            animate()
        }
    }
}


