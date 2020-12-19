//
//  BuniWayfViewModel.swift
//  
//
//  Created by BARIS UYAR on 19.12.2020.
//

import SwiftUI

public class BuniWayfViewModel: ObservableObject {
    
    @Published public var backgroundColor: Color = .red
    @Published public var wayfColor: Color = .white
    
    public init(backgroundColor: Color, wayfColor: Color) {
        self.backgroundColor = backgroundColor
        self.wayfColor = wayfColor
    }
}
