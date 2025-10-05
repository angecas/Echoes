//
//  AppSettings.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 04/10/2025.
//


import SwiftUI
import Combine

enum ModeType: String {
    case personal
    case legacy
}

final class AppSettings: ObservableObject {
    //@AppStorage
    static let shared = AppSettings()
    
    @Published var selectedMode: ModeType {
        didSet {
            UserDefaults.standard.set(selectedMode.rawValue, forKey: "selectedMode")
        }
    }
    
    @Published var isDarkMode: Bool {
        didSet { UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode") }
    }

    private init() {
        if let value = UserDefaults.standard.string(forKey: "selectedMode"),
           let mode = ModeType(rawValue: value) {
            self.selectedMode = mode
        } else {
            self.selectedMode = .personal
        }
        
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }

    static func saveMode(_ mode: ModeType) {
        shared.selectedMode = mode
    }
    
    static func loadMode() -> ModeType {
        return shared.selectedMode
    }
    
    static func saveDarkMode(_ enabled: Bool) { shared.isDarkMode = enabled }
    static func loadDarkMode() -> Bool { shared.isDarkMode }

}
