//
//  PurplishGradientBackgroundView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 02/10/2025.
//


import SwiftUI

struct PurplishGradientBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.5),
                    Color.white.opacity(0.8),
                    Color.purple.opacity(0.5)
                ]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()
            
            RadialGradient(
                gradient: Gradient(colors: [Color.pink.opacity(0.4), .clear]),
                center: .topLeading,
                startRadius: 120,
                endRadius: 400
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.indigo.opacity(0.4), .clear]),
                center: .bottomTrailing,
                startRadius: 150,
                endRadius: 500
            )
            .blendMode(.screen)

            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.3), .clear]),
                center: .topTrailing,
                startRadius: 100,
                endRadius: 350
            )
            .blendMode(.screen)
        }
    }
}
