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
    var imageName: String

    init(id: UUID, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}

