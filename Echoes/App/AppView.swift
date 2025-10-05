//
//  AppView.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//

import AVFoundation

import SwiftUI
import AVFoundation
import CoreData

@MainActor
struct AppView: View {
  @Environment(\.managedObjectContext) private var context
  @Environment(\.openWindow) private var openWindow
  @Environment(\.scenePhase) private var scenePhase

//  @Binding var appRouterPath: RouterPath
    @ObservedObject var routerPath: RouterPath
    @Binding var selectedTab: AppTab

  var body: some View {
    TabView(selection: $selectedTab) {
        ContentView()
        .tabItem { Label("Journal", systemImage: "book") }
        .tag(AppTab.journal)

        ContentView2()
        .tabItem { Label("Record", systemImage: "mic.fill") }
        .tag(AppTab.record)

        ContentView3()
        .tabItem { Label("Search", systemImage: "magnifyingglass") }
        .tag(AppTab.search)
    }
    .onChange(of: scenePhase) { _, newValue in
      handleScenePhase(newValue)
    }
  }

  private func handleScenePhase(_ phase: ScenePhase) {
    switch phase {
    case .background:

        try? context.save()
    case .active:
      UNUserNotificationCenter.current().setBadgeCount(0)
    default:
      break
    }
  }
}

import Foundation

enum AppTab: Hashable {
  case journal
  case record
  case search
  case settings

  var id: String {
    switch self {
    case .journal: "journal"
    case .record: "record"
    case .search: "search"
    case .settings: "settings"
    }
  }
}
