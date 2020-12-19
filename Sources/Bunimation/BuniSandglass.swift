//
//  BuniSandglass.swift
//  
//
//  Created by BARIS UYAR on 11.12.2020.
//

import SwiftUI

public struct Sandglass: View {
    
    public var lineWidth: CGFloat = 5
    public var size: CGSize = CGSize(width: 70, height: 120)
    public var sandColor: Color = .orange
    public var boxColor: Color = .black
    @State public var balance: CGFloat = 7
    
    @State private var degree: Double = 0
    @State private var topOffset: CGFloat = 0
    @State private var middleOffset: CGFloat = 0
    @State private var bottomOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    public init(lineWidth: CGFloat = 5, size: CGSize = .init(width: 70, height: 120),
                sandColor: Color = .orange, boxColor: Color = .black,
                balance: CGFloat = 7) {
        self.lineWidth = lineWidth
        self.size = size
        self.sandColor = sandColor
        self.boxColor = boxColor
        self.balance = balance
    }
    
    
    public var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: size.width, height: size.height / 2)
                    .foregroundColor(sandColor)
                    .offset(y: topOffset)
                    .mask(
                        Rectangle()
                            .frame(width: size.width, height: size.height / 2)
                    )
                    .offset(y: -size.height / 4 - 4)

                Rectangle()
                    .frame(width: 2 * balance - lineWidth, height: size.height / 2)
                    .foregroundColor(sandColor)
                    .offset(y: middleOffset)

                Rectangle()
                    .frame(width: size.width, height: size.height / 2 + 2)
                    .foregroundColor(sandColor)
                    .offset(y: bottomOffset)
                    .mask(
                        Rectangle()
                            .frame(width: size.width, height: size.height / 2 + 2)
                    )
                    .offset(y: size.height / 4 + 4)
            }
            .mask(
                GlassShape(balance: $balance)
                    .frame(width: size.width, height: size.height)
            )
            GlassShape(balance: $balance)
                .stroke(lineWidth: lineWidth)
                .frame(width: size.width, height: size.height)
                .foregroundColor(boxColor)

        }
        .rotationEffect(.degrees(degree))
        .onAppear {
            bottomOffset = size.height / 2 + 4
            middleOffset = -(size.height / 2 + 7)
        }
        .onTapGesture(count: 1) {
            if !isAnimating {
                isAnimating = true
                startAnimation()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    startAnimation()
                }
            }
        }
    }
    
    private func startAnimation() {
        withAnimation(Animation.linear(duration: 0.15)) {
            middleOffset = size.height / 4 - 4
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
            withAnimation(Animation.linear(duration: 0.25)) {
                middleOffset += (size.height / 4)
            }
        }
        withAnimation(Animation.linear(duration: 1)) {
            topOffset = size.height / 2
        }
        withAnimation(Animation.linear(duration: 1).delay(0.15)) {
            bottomOffset = 0
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                middleOffset = size.height / 4 + 3
                degree = 180
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                degree = 0
                topOffset = 0
                bottomOffset = size.height / 2
                middleOffset = -size.height / 4 - 7
            }
        }
    }
}
