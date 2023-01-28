//
//  Playlist.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 28.01.23.
//

import SwiftUI

class Playlist: ObservableObject, Identifiable {
    @Published var id: UUID = UUID()
    @Published var name: String
    @Published var song: [Song]
    @Published var showDeleteMode: Bool = false

    init(name: String,
         song: [Song]) {
        self.name = name
        self.song = song
    }
}

extension Playlist {
    static var mockGermanRap: Playlist {
        Playlist(
            name: "Deutsch Rap",
            song: [
                Song(
                    artist: "Shindy",
                    name: "Affalterbach"
                ),
                Song(
                    artist: "Luciano",
                    name: "On my way"
                ),
                Song(
                    artist: "Gzuz",
                    name: "Nie ohne mein Team"
                )
            ]
        )
    }

    static var mockTurkishPop: Playlist {
        Playlist(
            name: "Türkisch Pop",
            song: [
                Song(
                    artist: "Demet Akalin",
                    name: "Affedersen"
                ),
                Song(
                    artist: "Tarkan",
                    name: "Simarik"
                ),
                Song(
                    artist: "Emir Taha",
                    name: "Astigmat"
                )
            ]
        )
    }

    static var mockAmiRap: Playlist {
        Playlist(
            name: "US Rap",
            song: [
                Song(
                    artist: "Drake",
                    name: "Back to Back"
                ),
                Song(
                    artist: "Cardi B",
                    name: "Hot Shit"
                ),
                Song(
                    artist: "Hapollo",
                    name: "Flowcaine"
                )
            ]
        )
    }
}
