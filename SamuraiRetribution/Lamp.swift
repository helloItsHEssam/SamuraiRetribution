//
//  Lamp.swift
//  SamuraiRetribution
//
//  Created by HEssam on 3/27/24.
//

import SwiftUI

struct Lamp: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let heightOfLeg: CGFloat = rect.height * 0.3
        let midX = rect.maxX / 2
        path.move(to: .init(x: midX, y: 0))
        path.addLine(to: .init(x: midX, y: heightOfLeg))
        
        let stand = createLampStand(withOrigin: .init(x: .zero, y: heightOfLeg), in: rect)
        path.addPath(stand)
        
        let box = createLampBox(withOrigin: .init(x: .zero, y: heightOfLeg + 8), in: rect)
        path.addPath(box)
        
        return path
    }
    
    private func createLampStand(withOrigin origin: CGPoint, in rect: CGRect) -> Path {
        var path = Path()
        
        let spaceFromEdge = rect.maxX * 0.35
        let startPoint = CGPoint(x: spaceFromEdge, y: origin.y)
        path.move(to: startPoint)
        path.addLine(to: .init(x: rect.maxX - spaceFromEdge, y: origin.y))
        return path
    }
    
    private func createLampBox(withOrigin origin: CGPoint, in rect: CGRect) -> Path {
        var path = Path()
        
        let spaceFromEdge = rect.maxX * 0.28
        let startPoint = CGPoint(x: spaceFromEdge, y: origin.y)
        path.move(to: startPoint)
        path.addLine(to: .init(x: rect.maxX - spaceFromEdge, y: origin.y))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
