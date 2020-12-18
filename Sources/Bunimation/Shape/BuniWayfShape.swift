//
//  BuniWayfShape.swift
//  
//
//  Created by BARIS UYAR on 18.12.2020.
//

import SwiftUI

struct BuniWayfBaseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: 60, y: 60), radius: 60, startAngle: .degrees(22), endAngle: .degrees(158), clockwise: true)
        _ = path.strokedPath(.init(lineWidth: 5, dash: [1, 0], dashPhase: 10))
        path.move(to: CGPoint(x: 4.5, y: 82))
        path.addLine(to: CGPoint(x: rect.midX - 7, y: rect.maxY - 7))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 7, y: rect.maxY - 7), control: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - 4.5, y: 82))
        path.closeSubpath()
        
        return path
    }
}
