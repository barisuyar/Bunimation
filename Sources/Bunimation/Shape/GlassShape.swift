//
//  File.swift
//  
//
//  Created by BARIS UYAR on 11.12.2020.
//

import SwiftUI

struct GlassShape: Shape {
    
    @Binding var balance: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + balance, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + (2 * balance)),
                          control: CGPoint(x: rect.minX + (balance / 2), y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.midX - balance, y: rect.midY - 2))
        path.addLine(to: CGPoint(x: rect.midX - balance, y: rect.midY + 2))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - (2 * balance)))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX + balance, y: rect.maxY),
                          control: CGPoint(x: rect.minX, y: rect.maxY - balance))
        path.addLine(to: CGPoint(x: rect.maxX - balance, y: rect.maxY))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - (2 * balance)),
                          control: CGPoint(x: rect.maxX, y: rect.maxY - balance))
        path.addLine(to: CGPoint(x: rect.midX + balance, y: rect.midY + 2))
        path.addLine(to: CGPoint(x: rect.midX + balance, y: rect.midY - 2))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + (2 * balance)))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - balance, y: rect.minY),
                          control: CGPoint(x: rect.maxX, y: rect.minY + balance))
        path.closeSubpath()
        
        return path
    }
}
