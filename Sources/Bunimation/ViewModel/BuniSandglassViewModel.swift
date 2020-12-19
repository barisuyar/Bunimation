//
//  BuniSandglassViewModel.swift
//  
//
//  Created by BARIS UYAR on 19.12.2020.
//

import SwiftUI

public class BuniSandglassViewModel: ObservableObject {
    
    @Published var lineWidth: CGFloat = 5
    @Published var size: CGSize = CGSize(width: 70, height: 120)
    @Published var sandColor: Color = .orange
    @Published var boxColor: Color = .black
    @Published var balance: CGFloat = 7
    
    public init(lineWidth: CGFloat, size: CGSize, sandColor: Color, boxColor: Color, balance: CGFloat) {
        self.lineWidth = lineWidth
        self.size = size
        self.sandColor = sandColor
        self.boxColor = boxColor
        self.balance = balance
    }
}

