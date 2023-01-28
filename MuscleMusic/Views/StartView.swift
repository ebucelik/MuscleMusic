//
//  StartView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 27.01.23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(exerciseViewModel.exercises) { exercise in
                        NavigationLink {
                            StartDetailView(exercise: exercise)
                        } label: {
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(AppColor.backgroundV2)

                                Text(exercise.name)
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(AppColor.background)
                            .cornerRadius(6)
                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                        }

                    }
                }
                .padding()
            }
            .navigationBarTitle("Startpage")
        }
    }
}
