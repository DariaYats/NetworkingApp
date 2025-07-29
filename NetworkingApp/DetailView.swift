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
                deleteContact()
            }
        }

    }
    func deleteContact() {
        modelContext.delete(contact)
        dismiss()
    }
}

