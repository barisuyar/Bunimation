//
//  BuniLettersViewModel.swift
//  
//
//  Created by BARIS UYAR on 19.12.2020.
//

import Foundation

public class BuniLettersViewModel: ObservableObject {
    
    @Published var letters: [String]
    @Published var interval: Double
    
    public init(text: String, interval: Double) {
        self.letters = text.uppercased().map { "\($0)" }
        self.interval = interval
    }
}
