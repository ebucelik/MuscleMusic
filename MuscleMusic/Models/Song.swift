//
//  Song.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 28.01.23.
//

import SwiftUI

class Song: ObservableObject, Identifiable {
    @Published var id: UUID = UUID()
    @Published var artist: String
    @Published var name: String

    init(artist: String,
         name: String) {
        self.artist = artist
        self.name = name
    }
}
