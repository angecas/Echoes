//
//  EchoesApp.swift
//  echoes
//
//  Created by Angélica Rodrigues on 22/09/2025.
//

import SwiftUI
import FirebaseCore
import Firebase

//@main
//struct EchoesApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    
//    @StateObject private var routerPath = RouterPath()
//    
//    @State var selectedTab: AppTab = .journal
//    let persistenceController = PersistenceController.shared
//    
//    @StateObject private var settings = AppSettings.shared
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack(path: $routerPath.path) {
//                LandingView()
//                    .navigationDestination(for: RouterDestination.self, destination: destinationView)
//            }
//            .environmentObject(routerPath)
//            .environmentObject(settings)
//        }
//    }
    
//    // MARK: - Destination Builder
//    @ViewBuilder
//    private func destinationView(_ destination: RouterDestination) -> some View {
//        switch destination {
//        case .personalIntro:
//            UserModeView(modeType: .personal) {
//                routerPath.goToSignIn()
////                routerPath.navigate(to: .signIn)
//            }
//
//        case .legacyIntro:
//            UserModeView(modeType: .legacy) {
//                routerPath.goToSignIn()
////                routerPath.navigate(to: .signIn)
//            }
//
//        case .mainApp(let tab):
//            AppView(selectedTab: .constant(tab))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//
//        case .signIn:
//            LoginView()
//        }
//    }
//}

@main
struct EchoesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var routerPath = RouterPath()
    @State var selectedTab: AppTab = .journal
    
    let persistenceController = PersistenceController.shared
    @StateObject private var settings = AppSettings.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routerPath.path) {
                LandingView()
                    .withNavigationRouter(
                        routerPath: routerPath,
                        selectedTab: $selectedTab
                    )
            }
            .environmentObject(routerPath)
            .environmentObject(settings)
        }
    }
}
