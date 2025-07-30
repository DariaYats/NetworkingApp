//
//  AddContactView.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 15.07.2025.
//

import SwiftUI

struct AddContactView: View {
    let image: UIImage
    @State private var name = ""

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 40) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.headline)

            Button("Save") {
                saveContact()
                dismiss()
            }
        }
    }

    func saveContact() {
        guard !name.isEmpty else {
            // show error alert
            return
        }
        guard let imageName = saveImage() else {
            return
        }
        let contact = Contact(id: UUID(), name: name, imageName: imageName)
        modelContext.insert(contact)
    }

    func saveImage() -> String? {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return nil
        }

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let uniqueFileName = UUID().uuidString + ".jpg"
        let fileURL = documentsURL.appendingPathComponent(uniqueFileName)
        do {
            try imageData.write(to: fileURL)
            return uniqueFileName
        } catch {
            // show saving error
            return nil
        }
    }
}

//#Preview {
//    AddContactView(image: contact.image)
//}
