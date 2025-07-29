//
//  NetworkingAppApp.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 14.07.2025.
//
import SwiftData
import SwiftUI

@main
struct NetworkingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Contact.self)
    }
}
