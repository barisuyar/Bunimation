//
//  BuniLetters.swift
//  
//
//  Created by BARIS UYAR on 14.12.2020.
//

import SwiftUI

public struct BuniLetters: View {
    
    public var shouldShow: Binding<Bool>
    @ObservedObject public var viewModel: BuniLettersViewModel
    
    public init(viewModel: BuniLettersViewModel, shouldShow: Binding<Bool>) {
        self.viewModel = viewModel
        self.shouldShow = shouldShow
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<viewModel.letters.count) { index in
                    OneLetter(letter: viewModel.letters[index], bgColor: index == viewModel.letters.count - 1 ? .red : .gray)
                        .offset(calculateOffset(width: geometry.size.width, index: Double(index + 1)))
                }
            }
        }
    }
    
    private func calculateOffset(width: CGFloat, index: Double) -> CGSize {
        var offsetWidth: Double = Double((width / 2 - 20))
        if shouldShow.wrappedValue {
            let indexDependingSpace = ((index - 1) * 44)
            let widthSpecificSpace = ((Int(width) - (44 * viewModel.letters.count - 4)) / 2)
            offsetWidth = Double(widthSpecificSpace) + indexDependingSpace
        }
        
        return CGSize(width: offsetWidth, height: 0)
    }
}

private struct OneLetter: View {
    var letter: String
    var bgColor: Color = .gray
    
    var body: some View {
        Text(letter)
            .frame(width: 40, height: 40)
            .background(bgColor)
            .foregroundColor(.white)
            .font(.largeTitle)
            .cornerRadius(5)
    }
}
