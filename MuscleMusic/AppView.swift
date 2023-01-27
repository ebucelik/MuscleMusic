//
//  AppView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 27.01.23.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            StartView()
                .tabItem {
                    Image(systemName: "house")
                }

            ExerciseView()
                .tabItem {
                    Image(systemName: "dumbbell")
                }

            PlaylistView()
                .tabItem {
                    Image(systemName: "music.quarternote.3")
                }
        }
    }
}

#if DEBUG
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
#endif
