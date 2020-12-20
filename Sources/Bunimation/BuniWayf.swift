//
//  BuniWayf.swift
//  
//
//  Created by BARIS UYAR on 18.12.2020.
//

import SwiftUI

public struct BuniWayf: View {
    
    @State private var upperCircleYOffset: CGFloat = 145
    @State private var upperCircleTrimPositions: CGSize = CGSize(width: 0.75, height: 0.75)
    @State private var lowerCircleYOffset: CGFloat = 190
    @State private var lowerCircleTrimPositions: CGSize = CGSize(width: 0.75, height: 0.75)
    @State private var lowerCircleAngle: Angle = .degrees(0)
    @State private var fullCircleOffset: CGSize = CGSize(width: 0, height: 190)
    @State private var fullCircleSize: CGSize = CGSize(width: 0, height: 0)
    @State private var shouldStiff: Bool = false
    @State private var angle: Double = 0
    
    @ObservedObject public var viewModel: BuniWayfViewModel
    
    public init(viewModel: BuniWayfViewModel, shouldAnimate: Binding<Bool>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            BuniWayfBaseShape()
                .foregroundColor(viewModel.backgroundColor)
            Circle()
                .trim(from: upperCircleTrimPositions.width, to: upperCircleTrimPositions.height)
                .stroke(style: .init(lineWidth: 20, lineCap: .round))
                .frame(width: 100, height: 100)
                .foregroundColor(viewModel.wayfColor)
                .offset(y: upperCircleYOffset)
            Circle()
                .trim(from: lowerCircleTrimPositions.width, to: lowerCircleTrimPositions.height)
                .stroke(style: .init(lineWidth: 18, lineCap: .round, dash: []))
                .frame(width: 60, height: 60)
                .foregroundColor(viewModel.wayfColor)
                .offset(y: lowerCircleYOffset)
                .rotationEffect(lowerCircleAngle)
            Circle()
                .frame(width: fullCircleSize.width, height: fullCircleSize.height)
                .foregroundColor(viewModel.wayfColor)
                .offset(x: fullCircleOffset.width, y: fullCircleOffset.height)
        }
        .frame(width: 120, height: 145)
        .rotationEffect(.degrees(angle))
        .onTapGesture {
            animate()
        }
    }
    
    private func animate() {
        withAnimation(Animation.linear(duration: 0.7)) {
            upperCircleYOffset = 10
            upperCircleTrimPositions = .init(width: 0.6, height: 0.9)
            lowerCircleYOffset = 20
            lowerCircleTrimPositions = .init(width: 0.6, height: 0.9)
            fullCircleOffset = .init(width: 0, height: 20)
            fullCircleSize = .init(width: 25, height: 25)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.linear(duration: 0.2)) {
                fullCircleOffset = .init(width: 0, height: 30)
                lowerCircleYOffset = 25
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            withAnimation(.linear(duration: 0.4)) {
                fullCircleOffset = .init(width: 0, height: -10)
                lowerCircleAngle = .degrees(180)
                lowerCircleYOffset = 10
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.35) {
            withAnimation(.linear(duration: 0.4)) {
                fullCircleOffset = .init(width: -10, height: -10)
                lowerCircleAngle = .degrees(165)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.linear(duration: 0.15)) {
                fullCircleOffset = .init(width: 0, height: -10)
                lowerCircleAngle = .degrees(180)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            withAnimation(.linear(duration: 0.4)) {
                reset()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            animate()
        }
    }
    
    func reset() {
        withAnimation(.linear(duration: 1.4)) {
            upperCircleYOffset = 145
            upperCircleTrimPositions = CGSize(width: 0.75, height: 0.75)
            lowerCircleYOffset = 190
            lowerCircleTrimPositions = CGSize(width: 0.75, height: 0.75)
            lowerCircleAngle = .degrees(0)
            fullCircleOffset = CGSize(width: 0, height: 190)
            fullCircleSize = CGSize(width: 0, height: 0)
            shouldStiff = false
        }
        
       withAnimation(.linear(duration: 1)) {
            angle = angle == 0 ? 360 : 0
        }
    }
}
