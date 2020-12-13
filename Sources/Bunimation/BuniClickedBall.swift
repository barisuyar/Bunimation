//
//  BuniClickedBall.swift
//  
//
//  Created by BARIS UYAR on 13.12.2020.
//

import SwiftUI

public struct BuniClickedBall: View {
    
    @State private var offset: CGSize = .zero
    @State private var shouldRotate: Bool = false
    @State private var circleFrame: CGSize = CGSize(width: 15, height: 15)
    @State private var outerCirclesFrame: CGSize = CGSize(width: 20, height: 20)
    @State private var outerCirclesOpacity: Double = 0
    @State private var topOuterCircleOffset: CGSize = CGSize(width: 0, height: 30)
    @State private var bottomOuterCircleOffset: CGSize = CGSize(width: 0, height: -30)
    @State private var rightOuterCircleOffset: CGSize = CGSize(width: 30, height: 0)
    
    public var body: some View {
        ZStack {
            Circle()
                .frame(width: circleFrame.width, height: circleFrame.height)
                .offset(offset)
                .rotationEffect(Angle(degrees: shouldRotate ? 270 : 0))
            Circle()
                .frame(width: outerCirclesFrame.width, height: outerCirclesFrame.height)
                .offset(rightOuterCircleOffset)
                .foregroundColor(Color.black.opacity(outerCirclesOpacity))
            Circle()
                .frame(width: outerCirclesFrame.width, height: outerCirclesFrame.height)
                .offset(topOuterCircleOffset)
                .foregroundColor(Color.black.opacity(outerCirclesOpacity))
            Circle()
                .frame(width: outerCirclesFrame.width, height: outerCirclesFrame.height)
                .offset(bottomOuterCircleOffset)
                .foregroundColor(Color.black.opacity(outerCirclesOpacity))
        }
        .frame(width: 50, height: 50)
        .onAppear {
            animate()
        }
    }
    
    private func animate() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.linear(duration: 0.2)) {
                circleFrame = CGSize(width: 20, height: 20)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear(duration: 0.2)) {
                offset.height = -30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            withAnimation(Animation.linear(duration: 0.5)) {
                shouldRotate = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(Animation.linear(duration: 0.4)) {
                outerCirclesOpacity = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
            withAnimation(Animation.linear(duration: 0.4)) {
                offset = .zero
                rightOuterCircleOffset = .zero
                topOuterCircleOffset = .zero
                bottomOuterCircleOffset = .zero
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            withAnimation(Animation.linear(duration: 0.2)) {
                circleFrame = CGSize(width: 15, height: 15)
                outerCirclesFrame = circleFrame
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            reset()
            animate()
        }
    }
    
    private func reset() {
        
        offset = .zero
        shouldRotate = false
        circleFrame = CGSize(width: 15, height: 15)
        outerCirclesFrame = CGSize(width: 20, height: 20)
        outerCirclesOpacity = 0
        topOuterCircleOffset = CGSize(width: 0, height: 30)
        bottomOuterCircleOffset = CGSize(width: 0, height: -30)
        rightOuterCircleOffset = CGSize(width: 30, height: 0)
    }
}
