//
//  BlueGradientBackgroundView.swift
//  echoes
//
//  Created by Angélica Rodrigues on 29/09/2025.
//


import SwiftUI

struct BlueGradientBackgroundView2: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.6),
                    Color.white.opacity(0.8),
                    Color.blue.opacity(0.6)
                ]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()

            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.5), .clear]),
                center: .topLeading,
                startRadius: 120,
                endRadius: 400
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.3), .clear]),
                center: .bottomTrailing,
                startRadius: 150,
                endRadius: 450
            )
            .blendMode(.screen)
        }
    }
}
