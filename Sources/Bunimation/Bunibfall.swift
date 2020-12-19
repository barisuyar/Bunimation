//
//  SwiftUIView.swift
//  
//
//  Created by BARIS UYAR on 17.12.2020.
//

import SwiftUI

public struct Bunibfall: View {
    @State private var circleOffset: CGSize = CGSize(width: 0, height: -40)
    @State private var angle: Double = 90
    @State private var sticksOffset: CGFloat = 25
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Rectangle()
                .stroke(lineWidth: 2)
                .frame(width: 100, height: 100)
            Rectangle()
                .frame(width: 2, height: 50)
                .rotationEffect(Angle(degrees: angle))
                .offset(x: -sticksOffset)
            Rectangle()
                .frame(width: 2, height: 50)
                .rotationEffect(Angle(degrees: -angle))
                .offset(x: sticksOffset)
            Circle()
                .frame(width: 20, height: 20)
                .offset(x: circleOffset.width, y: circleOffset.height)
        }.onAppear {
            animate()
        }
    }
    
    private func animate() {
        withAnimation(Animation.linear(duration: 0.5)) {
            circleOffset.height = -15
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.linear(duration: 0.7)) {
                circleOffset.height = 40
                angle = 135
                sticksOffset = 32
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(Animation.linear(duration: 0.3)) {
                resetAnimation()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            animate()
        }
    }
    
    private func resetAnimation() {
        circleOffset = CGSize(width: 0, height: -40)
        angle = 90
        sticksOffset = 25
    }
}
