//
//  ContentView.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 14.07.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingPhotoPicker = false
    @State private var showingAddContactView = false
    @State private var selectedImage: UIImage?

    @Environment(\.modelContext) private var modelContext
    @Query private var contacts: [Contact]

    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(destination: DetailView()) {
                        HStack(spacing: 40) {
                            Text(contact.name)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("NetworkingApp")
        }

        Button("Add new photo") {
            showingPhotoPicker = true
        }
        .sheet(isPresented: $showingPhotoPicker) {
            PhotoPickerView { image in
                selectedImage = image
                if image != nil {
                    showingAddContactView = true
                }
            }
        }

//        .sheet(item: $selectedImage) { image in
//            AddContactView()
//        }

    }
}

#Preview {
    ContentView()
}
