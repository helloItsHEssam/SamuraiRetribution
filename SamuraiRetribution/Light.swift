//
//  Light.swift
//  SamuraiRetribution
//
//  Created by HEssam on 3/27/24.
//

import SwiftUI

struct Light: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let spaceFromEdge: CGFloat = 28
        let startPoint = CGPoint(x: spaceFromEdge, y: 0)
        path.move(to: startPoint)
        path.addLine(to: .init(x: rect.maxX - spaceFromEdge, y: 0))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
