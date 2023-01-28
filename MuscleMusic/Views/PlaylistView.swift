//
//  PlaylistView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 27.01.23.
//

import SwiftUI

struct PlaylistView: View {

    @StateObject var playlistViewModel: PlaylistViewModel = PlaylistViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(playlistViewModel.playlists, id: \.id) { playlist in
                        playlistBody(with: playlist)
                    }

                    Spacer()

                    NavigationLink {
                        PlaylistDetailView(playlistViewModel: playlistViewModel)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(AppColor.backgroundV2)
                    }
                }
                .padding()
                .navigationTitle(Text("Playlists"))
            }
        }
    }

    @ViewBuilder
    private func playlistBody(with playlist: Playlist) -> some View {
        HStack {
            VStack {
                Text(playlist.name)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .background(AppColor.background)
            .cornerRadius(6)
            .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)

            if playlist.showDeleteMode {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                    .padding()
                    .onTapGesture {
                        playlistViewModel.removePlaylist(playlist: playlist)
                    }
            }
        }
        .gesture(
            DragGesture(
                minimumDistance: 0,
                coordinateSpace: .local
            ).onEnded({ dragGestureValue in
                if dragGestureValue.translation.width < 0 {
                    playlistViewModel.showDelete(playlist: playlist)
                }

                if dragGestureValue.translation.width > 0 {
                    playlistViewModel.showDelete(playlist: playlist)
                }
            })
        )
    }
}

#if DEBUG
struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
#endif
