//
//  Buniexplode.swift
//  
//
//  Created by BARIS UYAR on 15.12.2020.
//

import SwiftUI

public struct Buniexplode: View {
    
    @State private var circleXOffset: CGFloat = -100
    @State private var height: CGFloat = 0
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .offset(x: circleXOffset)
            Rectangle()
                .frame(width: 10, height: 90)
                .foregroundColor(.white)
            Rectangle()
                .frame(width: 4, height: height)
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: 8, y: -10)
            Rectangle()
                .frame(width: 4, height: height)
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: 10)
            Rectangle()
                .frame(width: 4, height: height)
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: -45))
                .offset(x: 8, y: 10)
        }.onAppear {
            animate()
        }
    }
    
    private func animate() {
        withAnimation(Animation.linear(duration: 0.3)) {
            circleXOffset = -15
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(Animation.linear(duration: 0.1)) {
                height = 20
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.linear(duration: 0.6)) {
                height = 0
                circleXOffset = -100
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            animate()
        }
    }
}
