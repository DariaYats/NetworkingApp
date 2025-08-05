//
//  DetailView.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 15.07.2025.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let contact: Contact
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var isPresentedDeleteAlert: Bool = false

    var body: some View {
        VStack(spacing: 50) {
            if let image = UIImage.fromDocuments(named: contact.imageName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }

            Text(contact.name)
                .font(.largeTitle)
        }
        .toolbar {
            Button("Delete contact", systemImage: "trash") {
                isPresentedDeleteAlert = true
            }
        }
        .alert("Are you sure you want to delete this contact?", isPresented: $isPresentedDeleteAlert) {
            Button("Delete") {
                deleteContact()
            }
            Button("Cancel", role: .cancel) { }
        }

    }
    func deleteContact() {
        modelContext.delete(contact)
        dismiss()
    }
}

