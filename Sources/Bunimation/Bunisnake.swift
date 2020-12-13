//
//  Bunisnake.swift
//  
//
//  Created by Barış Uyar on 4.12.2020.
//

import SwiftUI

public struct Bunisnake<AnimatedView: View>: View {
    
    public var animatedView: AnimatedView
    public var count: Int = 5
    public var space: CGFloat = 0
    public var shouldShadow: Bool = false
    public var objectColor: Color = .random
    
    @State private var isDragging: Bool = false
    @State private var isUpper: Bool = false
    @State private var before: CGFloat = 0
    @State private var dragValue: CGSize = .zero
    
    public init(count: Int = 5, space: CGFloat = 0, shouldShadow: Bool = false, @ViewBuilder view: () -> AnimatedView) {
        self.animatedView = view()
        self.count = count
        self.space = space
        self.shouldShadow = true
    }
    
    public var body: some View {
        HStack(spacing: space) {
            ForEach(0..<count) { position in
                animatedView.foregroundColor(objectColor)
                    .offset(dragValue)
                    .animation(Animation.default.delay(Double(position) / 10))
                if shouldShadow && isDragging {
                    let heightOffset: CGFloat = isUpper ? 5 : -5
                    animatedView.foregroundColor(objectColor.opacity(0.5)).frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: dragValue.width - 20, y: dragValue.height + heightOffset)
                        .animation(Animation.default.delay(Double(position) / 10))
                }
            }
        }.gesture(
            DragGesture()
                .onChanged { 
                    dragValue = $0.translation
                    isUpper = $0.translation.height < before
                    isDragging = true
                    before = $0.translation.height
                }
                .onEnded { _ in
                    dragValue = .zero
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isDragging = false
                    }
                }
        )
    }
}
