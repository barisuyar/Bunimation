//
//  BuniEndless.swift
//  
//
//  Created by BARIS UYAR on 29.12.2020.
//

import SwiftUI

public struct BuniEndless: View {
    
    @State private var angle: Angle = .degrees(0)
    
    public var endlessColor: Binding<Color>
    public var ballsColor: Binding<Color>
    
    public init(endlessColor: Binding<Color>, ballsColor: Binding<Color>) {
        self.endlessColor = endlessColor
        self.ballsColor = ballsColor
    }
    
    public var body: some View {
        ZStack {
            Group {
                Circle()
                    .stroke(lineWidth: 15)
                    .frame(width: 50, height: 50)
                    .foregroundColor(endlessColor.wrappedValue)
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(ballsColor.wrappedValue)
                    .offset(x: -25)
                    .rotationEffect(angle)
                    .zIndex(1)
            }.offset(x: -25)
            Group {
                Circle()
                    .stroke(lineWidth: 15)
                    .frame(width: 50, height: 50)
                    .foregroundColor(endlessColor.wrappedValue)
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(ballsColor.wrappedValue)
                    .offset(x: 25, y: 0)
                    .rotationEffect(angle)
            }
            .offset(x: 25)
        }
        .onAppear {
            animate()
        }
    }
    
    func animate() {
        withAnimation(.linear(duration: 2)) {
            angle = .degrees(360)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.linear(duration: 0.5)) {
                angle = .degrees(90)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.linear(duration: 0.5)) {
                angle = .degrees(-90)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            withAnimation(.linear(duration: 0.5)) {
                angle = .degrees(0)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
            animate()
        }
    }
}
