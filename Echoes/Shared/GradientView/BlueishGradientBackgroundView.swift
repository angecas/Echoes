//
//  BlueishGradientBackgroundView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 02/10/2025.
//



import SwiftUI

struct BlueGradientBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.4),
                    Color.white.opacity(0.8),
                    Color.blue.opacity(0.4)
                ]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()
            
            RadialGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.5), .clear]),
                center: .topLeading,
                startRadius: 100,
                endRadius: 400
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.4), .clear]),
                center: .bottomTrailing,
                startRadius: 150,
                endRadius: 500
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.3), .clear]),
                center: .topTrailing,
                startRadius: 80,
                endRadius: 350
            )
            .blendMode(.screen)
        }
    }
}
