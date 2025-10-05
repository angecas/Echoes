//
//  ContentView3.swift
//  Echoes
//
//  Created by Angélica Rodrigues on 01/10/2025.
//



import SwiftUI
import CoreData

struct ContentView3: View {

    var body: some View {
        VStack {
            Color.blue
        }
    }
}

struct ContentView2: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack {
            Color.red
        }
    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            Color.green
        }
    }
}
