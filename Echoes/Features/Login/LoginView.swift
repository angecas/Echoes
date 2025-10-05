//
//  LoginView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 02/10/2025.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var settings: AppSettings
//    @EnvironmentObject var routerPath: RouterPath
//    @Binding var appRouterPath: RouterPath
    @ObservedObject var routerPath: RouterPath

    var body: some View {
            ZStack {
                
                if settings.selectedMode == .personal {
                    BlueGradientBackgroundView()
                } else {
                    PurplishGradientBackgroundView()
                }
                
                VStack(spacing: 20) {
                    Text("Echoes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(12)
                    
                    SecureField("Password", text: $viewModel.password)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(12)
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        HStack(spacing: 20) {
                            Button(action: {
                                Task {
                                    await viewModel.signIn()
//                                    routerPath.goToMainApp(tab: .journal)
                                }
                            }) {
                                Text("Sign In")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: { Task {
                                await viewModel.signUp()
                            }
                            }) {
                                Text("Sign Up")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding()
            }
        }
}
