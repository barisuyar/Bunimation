//
//  BuniCasper.swift
//  
//
//  Created by BARIS UYAR on 13.12.2020.
//

import SwiftUI

public struct BuniCasper: View {
    
    @State private var showEyes: Bool = true
    @State public var interval: Double = 0.5
    @State public var casperColor: Color = .black
    @State public var eyesColor: Color = .black
    
    public init(interval: Double = 0.5, casperColor: Color = .black, eyesColor: Color = .black) {
        self.interval = interval
        self.casperColor = casperColor
        self.eyesColor = eyesColor
    }
    
    public var body: some View {
        VStack {
            ZStack {
                CasperShape()
                    .stroke(lineWidth: 4)
                    .frame(width: 50, height: 40)
                    .foregroundColor(casperColor)
                CasperEyesShape()
                    .offset(CGSize(width: -10, height: -2.0))
                    .frame(width: 18, height: 10)
                    .scaleEffect(CGSize(width: 1, height: showEyes ? 1 : 0.3))
                    .animation(Animation.easeIn.delay(0.05))
                    .foregroundColor(eyesColor)
            }
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                showEyes.toggle()
            }
        }
    }
}


