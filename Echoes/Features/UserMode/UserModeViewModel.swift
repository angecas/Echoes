//
//  UserModeViewModel.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 05/10/2025.
//



import Foundation
import FirebaseAuth

class UserModeViewModel: ObservableObject {
        

    func saveMode(_ mode: ModeType) {
        AppSettings.saveMode(mode)
    }
}
