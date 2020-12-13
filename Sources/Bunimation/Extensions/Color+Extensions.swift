//
//  Color+Extensions.swift
//  
//
//  Created by Barış Uyar on 4.12.2020.
//

import SwiftUI

extension Color {
    static public var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
