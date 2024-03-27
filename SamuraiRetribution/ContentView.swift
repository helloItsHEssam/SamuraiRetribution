//
//  ContentView.swift
//  SamuraiRetribution
//
//  Created by HEssam on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotationAngle: Double = 5
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
                        
            VStack(alignment: .leading, spacing: 0) {
                
                HStack(alignment: .bottom, spacing: 0) {
                    
                    LampStand()
                        .stroke(Color(.stroke), lineWidth: 4)
                        .frame(width: 140, height: 300)
                    
                    VStack(spacing: 2) {
                        Lamp()
                            .stroke(Color(.stroke), lineWidth: 4)
                            .frame(width: 70, height: 70)
                        
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color.red,
                                    Color.red,
                                    Color.red,
                                    Color.clear,
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(width: 130, height: 300)
                        .mask(Light())
                        .clipped()
                        .blendMode(.color)
                    }
                    .zIndex(10)
                    .rotationEffect(.degrees(rotationAngle), anchor: .top)
                    .animation(.spring(response: 1.5, dampingFraction: 0.85, blendDuration: 0.8).repeatForever(), value: rotationAngle)
                    .offset(x: -80, y: 80)
                    .onAppear {
                        withAnimation {
                            rotationAngle = -65
                        }
                    }
                    
                    Spacer()
                    
                    Image(.samurai)
                        .resizable()
                        .renderingMode(.template)
                        .colorMultiply(.stroke)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .offset(.init(width: 0, height: 13))
                }
                
                BottomLine()
                    .stroke(Color(.stroke), lineWidth: 4)
                    .frame(height: 4)
            }
        }
    }
}

#Preview {
    ContentView()
}
