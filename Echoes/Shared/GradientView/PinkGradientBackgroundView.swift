//
//  PinkGradientBackgroundView.swift
//  echoes
//
//  Created by Angélica Rodrigues on 29/09/2025.
//


import SwiftUI

struct PinkGradientBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.4),
                    Color.white.opacity(0.8),
                    Color.purple.opacity(0.4)
                ]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()

            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.4), .clear]),
                center: .topTrailing,
                startRadius: 100,
                endRadius: 350
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.pink.opacity(0.3), .clear]),
                center: .bottomLeading,
                startRadius: 150,
                endRadius: 450
            )
            .blendMode(.screen)
        }
    }
}
