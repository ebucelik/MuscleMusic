//
//  PlaylistDetailView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 28.01.23.
//

import SwiftUI

struct PlaylistDetailView: View {

    @StateObject var playlistViewModel: PlaylistViewModel
    @State var name: String = ""
    @State var songArtist: String = ""
    @State var songName: String = ""

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField(text: $name) {
                    Text("Playlist Name")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(AppColor.background)
                .cornerRadius(6)
                .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)

                songBody()
                    .padding()
                    .background(AppColor.background)
                    .cornerRadius(6)
                    .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
            }
            .navigationTitle(Text("Playlist hinzufügen"))

            Spacer()

            Text("Save")
                .bold()
                .padding()
                .background(AppColor.background)
                .cornerRadius(6)
                .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                .onTapGesture {
                    playlistViewModel.addPlaylist(playlist: Playlist(name: name, song: [Song(artist: songArtist, name: songName)]))
                }
        }
        .padding()
    }

    @ViewBuilder
    private func songBody() -> some View {
        VStack {
            TextField(text: $songArtist) {
                Text("Song Name")
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)

            TextField(text: $songName) {
                Text("Song Name")
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
        }
    }
}
