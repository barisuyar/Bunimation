//
//  BuniGradientCycle.swift
//
//
//  Created by BAHATTIN KOC on 29.08.2024.
//

import SwiftUI

public struct BuniGradientCycle: View {
    @ObservedObject private var viewModel: BuniGradientCycleViewModel
    @State private var isAnimating = false

    private var color: Color { viewModel.color }
    private var gradient: Gradient { Gradient(colors: [color.opacity(0.1),
                                                       color.opacity(0.25),
                                                       color.opacity(0.5),
                                                       color]) }

    public init(viewModel: BuniGradientCycleViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(viewModel.backgroundColor)
                .frame(width: viewModel.radius, height: viewModel.radius)
                .overlay(
                    Circle()
                        .strokeBorder(
                            AngularGradient(gradient: gradient, center: .center, angle: .degrees(isAnimating ? 360 : 0)),
                            lineWidth: viewModel.radius / 2
                        )
                )
                .onAppear() {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        isAnimating.toggle()
                    }
                }
        }
    }
}

#Preview {
    BuniGradientCycle(viewModel: BuniGradientCycleViewModel())
}
