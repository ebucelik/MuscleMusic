//
//  PlaylistViewModel.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 28.01.23.
//

import SwiftUI

class PlaylistViewModel: ObservableObject {
    @Published var playlists: [Playlist] = [.mockAmiRap, .mockGermanRap]

    func addPlaylist(playlist: Playlist) {
        playlists.append(playlist)
    }

    func showDelete(playlist: Playlist) {
        objectWillChange.send()

        playlists.first(where: { $0.id == playlist.id })?.showDeleteMode.toggle()
    }

    func removePlaylist(playlist: Playlist) {
        objectWillChange.send()

        playlists.removeAll(where: { $0.id == playlist.id })
    }
}
