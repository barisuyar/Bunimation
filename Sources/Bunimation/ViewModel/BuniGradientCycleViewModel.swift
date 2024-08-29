//
//  BuniGradientCycleViewModel.swift
//
//
//  Created by BAHATTIN KOC on 29.08.2024.
//

import SwiftUI

public class BuniGradientCycleViewModel: ObservableObject {

    @Published var radius: Double
    @Published var color: Color
    @Published var backgroundColor: Color

    public init(radius: Double = 100, color: Color = .gray, backgroundColor: Color = .black) {
        self.radius = radius
        self.color = color
        self.backgroundColor = backgroundColor
    }
}
