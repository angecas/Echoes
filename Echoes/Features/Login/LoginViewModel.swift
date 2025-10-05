//
//  LoginViewModel.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 02/10/2025.
//


import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
        
    @discardableResult
    func signIn() async ->  AuthDataResult? {
        await MainActor.run {
             isLoading = true
             errorMessage = nil
         }
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            await MainActor.run {
                isLoggedIn = true
                isLoading = false
            }
            return result
        } catch {
            await MainActor.run {
                errorMessage = error.localizedDescription
                isLoading = false
            }
            return nil
        }

    }
    
    @discardableResult
    func signUp() async -> AuthDataResult? {

        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }

        do {

            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            await MainActor.run {
                isLoggedIn = true
                isLoading = false
            }

            return result
        } catch {

            await MainActor.run {
                errorMessage = error.localizedDescription
                isLoading = false
            }
            return nil
        }
    }

    func signOut() throws {
        try Auth.auth().signOut()
        Task { @MainActor in
            isLoggedIn = false
        }
    }
}
