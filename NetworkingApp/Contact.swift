//
//  Contact.swift
//  NetworkingApp
//
//  Created by Daria Yatsyniuk on 14.07.2025.
//

import SwiftData
import Foundation

@Model
class Contact {
    var id: UUID
    var name: String
    var image: URL

    init(id: UUID, name: String, image: URL) {
        self.id = id
        self.name = name
        self.image = image
    }
}


