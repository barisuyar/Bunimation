//
//  File.swift
//  
//
//  Created by BARIS UYAR on 19.12.2020.
//

import SwiftUI

public class BuniSnakeViewModel<AnimatedView: View>: ObservableObject {
    
    @Published public var animatedView: AnimatedView
    @Published public var count: Int = 5
    @Published public var space: CGFloat = 0
    @Published public var shouldShadow: Bool = false
    @Published public var objectColor: Color = .random
    
    public init(count: Int = 5, space: CGFloat = 0, shouldShadow: Bool = false, objectColor: Color = .random ,@ViewBuilder view: () -> AnimatedView) {
        self.animatedView = view()
        self.count = count
        self.space = space
        self.shouldShadow = true
        self.objectColor = objectColor
    }
}
