//
//  CasperShape.swift
//  
//
//  Created by BARIS UYAR on 13.12.2020.
//

import SwiftUI

struct CasperShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: 20, y: 20), radius: 20, startAngle: .degrees(0), endAngle: .degrees(100), clockwise: true)
        _ = path.strokedPath(.init(lineWidth: 5, dash: [1, 0], dashPhase: 10))
        
        path.move(to: CGPoint(x: 15, y: rect.height - 0.5))
        path.addLine(to: CGPoint(x: 35, y: rect.height - 0.5))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height / 2), control: CGPoint(x: 55, y: 35))
        path.addLine(to: CGPoint(x: 38, y: 20))
        
        return path
    }
}

struct CasperEyesShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
            
        path.addEllipse(in: CGRect(x: 0, y: 0, width: 8, height: 10))
        path.addEllipse(in: CGRect(x: 10, y: 0, width: 8, height: 10))
        
        return path
    }
}
