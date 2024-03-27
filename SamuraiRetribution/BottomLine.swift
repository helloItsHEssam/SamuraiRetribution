//
//  BottomLine.swift
//  SamuraiRetribution
//
//  Created by HEssam on 3/27/24.
//

import SwiftUI

struct BottomLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: .init(x: rect.maxX, y: 0))
        
        return path
    }
}
