//
//  BuniSandglass.swift
//  
//
//  Created by BARIS UYAR on 11.12.2020.
//

import SwiftUI

public struct Sandglass: View {
    
    @ObservedObject public var viewModel: BuniSandglassViewModel
    
    @State private var degree: Double = 0
    @State private var topOffset: CGFloat = 0
    @State private var middleOffset: CGFloat = 0
    @State private var bottomOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    public init(viewModel: BuniSandglassViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: viewModel.size.width, height: viewModel.size.height / 2)
                    .foregroundColor(viewModel.sandColor)
                    .offset(y: topOffset)
                    .mask(
                        Rectangle()
                            .frame(width: viewModel.size.width, height: viewModel.size.height / 2)
                    )
                    .offset(y: -viewModel.size.height / 4 - 4)

                Rectangle()
                    .frame(width: 2 * viewModel.balance - viewModel.lineWidth, height: viewModel.size.height / 2)
                    .foregroundColor(viewModel.sandColor)
                    .offset(y: middleOffset)

                Rectangle()
                    .frame(width: viewModel.size.width, height: viewModel.size.height / 2 + 2)
                    .foregroundColor(viewModel.sandColor)
                    .offset(y: bottomOffset)
                    .mask(
                        Rectangle()
                            .frame(width: viewModel.size.width, height: viewModel.size.height / 2 + 2)
                    )
                    .offset(y: viewModel.size.height / 4 + 4)
            }
            .mask(
                GlassShape(balance: viewModel.balance)
                    .frame(width: viewModel.size.width, height: viewModel.size.height)
            )
            GlassShape(balance: viewModel.balance)
                .stroke(lineWidth: viewModel.lineWidth)
                .frame(width: viewModel.size.width, height: viewModel.size.height)
                .foregroundColor(viewModel.boxColor)

        }
        .rotationEffect(.degrees(degree))
        .onAppear {
            bottomOffset = viewModel.size.height / 2 + 4
            middleOffset = -(viewModel.size.height / 2 + 7)
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
            middleOffset = viewModel.size.height / 4 - 4
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
            withAnimation(Animation.linear(duration: 0.25)) {
                middleOffset += (viewModel.size.height / 4)
            }
        }
        withAnimation(Animation.linear(duration: 1)) {
            topOffset = viewModel.size.height / 2
        }
        withAnimation(Animation.linear(duration: 1).delay(0.15)) {
            bottomOffset = 0
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                middleOffset = viewModel.size.height / 4 + 3
                degree = 180
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                degree = 0
                topOffset = 0
                bottomOffset = viewModel.size.height / 2
                middleOffset = -viewModel.size.height / 4 - 7
            }
        }
    }
}
