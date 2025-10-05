//
//  UserModeView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//



import SwiftUI

import SwiftUI

struct UserModeView: View {
    let modeType: ModeType
//    @Binding var appRouterPath: RouterPath
    @ObservedObject var routerPath: RouterPath

    @StateObject private var viewModel = UserModeViewModel()
    

    private var title: String {
        modeType == .personal ? "Personal Mode" : "Legacy Mode"
    }

    private var subtitle: String {
        modeType == .personal ? "Your private journey in one place" :
                                "Leave messages for someone special"
    }

    private var iconName: String {
        modeType == .personal ? "feather" : "infinity"
    }
    
    private var description: String {
    modeType == .personal ? "Keep a private journal of your life’s moments. Capture thoughts, voice notes, photos, and videos just for yourself. Over time, your memories become echoes you can return to, serving as reminders of how you felt, what you experienced, and the journey you’ve taken. Reflect on your life with daily reminders, mood tracking, and “On this day” memories that let you revisit the past and see how far you’ve come." : "Create messages meant for someone special. Record words, stories, or videos they can receive on meaningful dates such as birthdays, anniversaries, or other milestones. Plan messages in advance and schedule them to be delivered at the right moment, letting your loved ones experience your presence even when you can’t be there. Legacy Mode helps you leave behind echoes of love, wisdom, or encouragement that can be cherished for years to come."
    }

    private var buttonColor: Color {
        modeType == .personal ? Color.blue : Color.purple
    }
    
    @ViewBuilder
    private var gradientView: some View {
        if modeType == .personal {
            BlueGradientBackgroundView()
        } else {
            PurplishGradientBackgroundView()
        }
    }

    var body: some View {
        ZStack {
            gradientView
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    HStack {
                        Image(iconName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                        Text(title)
                            .font(.system(size: 34, weight: .bold, design: .serif))
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                    }
                    Text(subtitle)
                        .font(.system(size: 18, weight: .medium, design: .serif))
                        .foregroundColor(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }
                .padding(.top, 40)
                
                ScrollView {
                    Text(description)
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(.white)
                        .lineSpacing(6)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.black.opacity(0.2))
                .cornerRadius(16)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: { routerPath.pop() }) {
                        Text("Back")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                Capsule()
                                    .stroke(Color.white.opacity(0.8), lineWidth: 2)
                            )
                    }

                    Button(action: {
                        viewModel.saveMode(modeType)
                        routerPath.goToSignIn()
                    }) {
                        Text("Continue")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                Capsule()
                                    .fill(buttonColor)
                                    .shadow(color: buttonColor.opacity(0.5), radius: 8, x: 0, y: 4)
                            )
                    }
                }
                .padding(.bottom, 40)
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }
}
