//
//  Bunisnake.swift
//  
//
//  Created by Barış Uyar on 4.12.2020.
//

import SwiftUI

public struct BuniSnake<AnimatedView: View>: View {
    
    @State private var isDragging: Bool = false
    @State private var isUpper: Bool = false
    @State private var before: CGFloat = 0
    @State private var dragValue: CGSize = .zero
    
    @ObservedObject public var viewModel: BuniSnakeViewModel<AnimatedView>
    
    public init(viewModel: BuniSnakeViewModel<AnimatedView>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HStack(spacing: viewModel.space) {
            ForEach(0..<viewModel.count) { position in
                viewModel.animatedView.foregroundColor(viewModel.objectColor)
                    .offset(dragValue)
                    .animation(Animation.default.delay(Double(position) / 10))
                if viewModel.shouldShadow && isDragging {
                    let heightOffset: CGFloat = isUpper ? 5 : -5
                    viewModel.animatedView.foregroundColor(viewModel.objectColor.opacity(0.5)).frame(width: 20, height: 20)
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
