//
//  LandingView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//


import SwiftUI
import CoreData

struct LandingView: View {
    
//    @Environment(RouterPath.self) private var routerPath
    @EnvironmentObject var routerPath: RouterPath


    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 40) {
                Spacer()
                
                Text("echoes")
                    .font(.system(size: 48, weight: .light, design: .serif))
                    .tracking(2)
                    .foregroundColor(.white)
                
                Text("Welcome to echoes\nChoose your journey below")
                    .font(.system(size: 24, weight: .thin, design: .serif))
                    .multilineTextAlignment(.center)

                Spacer()

                VStack(spacing: 16) {
                    Button(action: {
                        routerPath.goToPersonalIntro()
//                        routerPath.navigate(to: .personalIntro)
                    }) {
                        Text("Personal Mode")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.blue.opacity(0.6))
                            .clipShape(Capsule())
                    }

                    Button(action: {
                        routerPath.goToLegacyIntro()
//                        routerPath.navigate(to: .legacyIntro)
                    }) {
                        Text("Legacy Mode")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.purple.opacity(0.6))
                            .clipShape(Capsule())
                    }
                }

                Spacer()
                
                
                Text("Already have an account? Log in")
                    .font(.system(size: 16, weight: .light, design: .serif))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal, 16)

        }
    }
}
