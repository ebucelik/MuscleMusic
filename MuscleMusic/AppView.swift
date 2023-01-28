//
//  AppView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 27.01.23.
//

import SwiftUI

public class ExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise]

    init(exercises: [Exercise] = ExerciseView.mockExercises) {
        self.exercises = exercises
    }
}

struct AppView: View {
    @StateObject var exerciseViewModel: ExerciseViewModel = ExerciseViewModel()

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
        .environmentObject(exerciseViewModel)
    }
}

#if DEBUG
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
#endif
