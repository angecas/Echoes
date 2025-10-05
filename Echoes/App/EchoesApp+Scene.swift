//
//  EchoesApp+Scene.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//

import SwiftUI

extension EchoesApp {
  var appScene: some Scene {
    WindowGroup(id: "MainWindow") {
      AppView(
        routerPath: routerPath, selectedTab: $selectedTab
      )
      .onAppear {
      }

//      .environment(pushNotificationsService)
      .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
    #if targetEnvironment(macCatalyst)
      .windowResize()
    #endif
  }
}

extension Scene {
  func windowResize() -> some Scene {
    self.windowResizability(.contentSize)
  }
}
