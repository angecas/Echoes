//
//  RouterDestination.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//



import SwiftUI

//MARK: Navigation destinations
enum RouterDestination: Hashable {
    case personalIntro
    case legacyIntro
    case mainApp(AppTab)
    case signIn
}

@MainActor
class RouterPath: ObservableObject {
    @Published var path: [RouterDestination] = []

    // MARK: - Navigation actions
    func goToPersonalIntro() {
        path.append(.personalIntro)
    }

    func goToLegacyIntro() {
        path.append(.legacyIntro)
    }

    func goToSignIn() {
        path.append(.signIn)
    }

    func goToMainApp(tab: AppTab) {
        path.removeAll()
        path.append(.mainApp(tab))
    }

    func pop() {
        _ = path.popLast()
    }

    func reset() {
        path.removeAll()
    }
}

extension View {
    func withNavigationRouter(routerPath: RouterPath, selectedTab: Binding<AppTab>) -> some View {
        self.navigationDestination(for: RouterDestination.self) { destination in
            switch destination {
            case .mainApp(let tab):
                AppView(
                    routerPath: routerPath, selectedTab: selectedTab
                )
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

            case .personalIntro:
                UserModeView(modeType: .personal, routerPath: routerPath)
            case .legacyIntro:
                UserModeView(modeType: .legacy, routerPath: routerPath)
            case .signIn:
                LoginView(routerPath: routerPath)
            }
        }
    }
}
