//
//  LampStand.swift
//  SamuraiRetribution
//
//  Created by HEssam on 3/27/24.
//

import SwiftUI

struct LampStand: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // stand
        let lampStandPath = createLampStand(
            withOrigin: .init(
                x: rect.maxX * 0.08,
                y: rect.maxY
            ),
            in: rect
        )
        path.addPath(lampStandPath)
        
        // leg
        let midXStand = (rect.maxX * 0.08) + (rect.maxX * 0.2 + rect.maxX * 0.4) / 2
        let lampLegPath = createLampMainLeg(
            withOrigin: .init(
                x: midXStand,
                y: rect.maxY - (rect.maxY * 0.1)
            ),
            in: rect
        )
        path.addPath(lampLegPath)

        // secondary leg
        let startYSecondrayLeg = rect.maxY * 0.35
        let lampSecondaryLegPath = createLampSecondaryLeg(
            withOrigin: .init(
                x: 0,
                y: startYSecondrayLeg
            ),
            in: rect
        )
        path.addPath(lampSecondaryLegPath)
        
        // circle
        let slopOfSecondaryLeg = (0 - startYSecondrayLeg).magnitude / (rect.maxX - 0)
        let midY = slopOfSecondaryLeg * (rect.maxX - midXStand)
        let firstCirclePath = createCircle(
            withOrigin: .init(
                x: midXStand,
                y: midY.magnitude
            )
        )
        path.addPath(firstCirclePath)
        
        // circle
        let lampXCircle = rect.maxX - (rect.maxX * 0.1)
        let midYLampCircle = slopOfSecondaryLeg * (rect.maxX - lampXCircle)
        let holderLampCirclePath = createCircle(
            withOrigin: .init(
                x: lampXCircle,
                y: midYLampCircle
            )
        )
        path.addPath(holderLampCirclePath)
        
        return path
    }
    
    private func createLampStand(withOrigin origin: CGPoint, in rect: CGRect) -> Path {
        var path = Path()
                
        let x = origin.x
        let y = origin.y
        
        let xAddition = rect.maxX * 0.2
        let yAddition = rect.maxY * 0.1
        path.move(to: .init(x: x, y: y))
        path.addCurve(to: .init(x: x + xAddition, y: y - yAddition),
                      control1: .init(x: x, y: y),
                      control2: .init(x: x, y: y - yAddition))
        
        let width = rect.maxX * 0.4
        let x2 = x + width
        let y2 = y - yAddition
        path.addLine(to: .init(x: x2, y: y2))
        path.addCurve(to: .init(x: x2 + xAddition, y: y2 + yAddition),
                      control1: .init(x: x2, y: y2),
                      control2: .init(x: x2 + xAddition, y: y2))
        
        return path
    }
    
    private func createLampMainLeg(withOrigin origin: CGPoint, in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: origin)
        let yAddition = rect.maxY * 0.15
        path.addLine(to: .init(x: origin.x, y: rect.minY + yAddition))
        return path
    }
    
    private func createLampSecondaryLeg(withOrigin origin: CGPoint, in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: origin)
        path.addLine(to: .init(x: rect.maxX, y: 0))
        return path
    }
    
    private func createCircle(withOrigin origin: CGPoint) -> Path {
        var path = Path()
        
        path.move(to: origin)
        path.addArc(center: origin, radius: 4, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
        return path
    }
}
