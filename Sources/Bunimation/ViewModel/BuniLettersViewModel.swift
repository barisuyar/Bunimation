//
//  BuniLettersViewModel.swift
//  
//
//  Created by BARIS UYAR on 19.12.2020.
//

import SwiftUI

public class BuniLettersViewModel: ObservableObject {
    
    @Published var letters: [String]
    @Published var interval: Double
    @Published var specialCharacterBackgroundColor: Color
    @Published var characterBackgroundColor: Color
    
    public init(text: String, interval: Double, specialCharacterBackgroundColor: Color, characterBackgroundColor: Color) {
        self.letters = text.uppercased().map { "\($0)" }
        self.interval = interval
        self.specialCharacterBackgroundColor = specialCharacterBackgroundColor
        self.characterBackgroundColor = characterBackgroundColor
    }
}
