//
//  BuniLetters.swift
//  
//
//  Created by BARIS UYAR on 14.12.2020.
//

import SwiftUI

public struct BuniLetters: View {
    
    @State public var shouldShow: Bool = false
    @State public var parsedLetters: [String] = [""]
    
    public init(shouldShow: Bool = false, letters: [String]) {
        self.shouldShow = shouldShow
        self.parsedLetters = letters
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<parsedLetters.count) { index in
                    OneLetter(letter: parsedLetters[index], bgColor: index == parsedLetters.count - 1 ? .red : .gray)
                        .offset(calculateOffset(width: geometry.size.width, index: Double(index + 1)))
                }
            }
        }
    }
    
    private func calculateOffset(width: CGFloat, index: Double) -> CGSize {
        var offsetWidth: Double = Double((width / 2 - 20))
        if shouldShow {
            let indexDependingSpace = ((index - 1) * 44)
            let widthSpecificSpace = ((Int(width) - (44 * parsedLetters.count - 4)) / 2)
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
