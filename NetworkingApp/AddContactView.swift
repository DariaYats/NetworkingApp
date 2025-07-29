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

    var body: some View {
        VStack(spacing: 40) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.headline)

            Button("Save") {

            }
        }
    }

    func saveContact() {
        
    }
}

#Preview {
    AddContactView(image: .example)
}
