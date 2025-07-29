//
//  ContentView.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 14.07.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    enum Sheet: Identifiable, Hashable {
        var id: Sheet { self }

        case photoPicker
        case addContact(UIImage)
    }

    @State private var sheet: Sheet?

    @Environment(\.modelContext) private var modelContext
    @Query private var contacts: [Contact]

    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(destination: DetailView(contact: contact)) {
                        HStack(spacing: 40) {
                            if let image = UIImage.fromDocuments(named: contact.imageName) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                            }

                            Text(contact.name)
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("NetworkingApp")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add new photo", systemImage: "plus") {
                        sheet = .photoPicker
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }

        .sheet(item: $sheet) { sheet in
            switch sheet {
            case .photoPicker:
                PhotoPickerView { image in
                    guard let image else { return }
                    self.sheet = .addContact(image)
                }
            case .addContact(let image):
                AddContactView(image: image)
            }
        }
    }
    func deleteContact(at offsets: IndexSet) {
        for offset in offsets {
            let contact = contacts[offset]

            modelContext.delete(contact)
        }
    }
}


#Preview {
    ContentView()
}
