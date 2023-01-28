//
//  ExerciseView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 27.01.23.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var name: String
    var playlist: String //Playlist
    var info: String
    
    init(id: UUID = UUID(), name: String, playlist: String, info: String) {
        self.id = id
        self.name = name
        self.playlist = playlist
        self.info = info
    }
}

struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var sections: [Section]
}

struct ExerciseView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(exerciseViewModel.exercises) { exercise in
                        NavigationLink(destination: TrainingView(exercise: .constant(exerciseViewModel.exercises.first(where: {$0.id == exercise.id})!))) {
                            Text(exercise.name)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppColor.background)
                                .cornerRadius(6)
                                .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(AppColor.backgroundV2)
                }
                .padding()
            }
            .navigationBarTitle("Trainings")
        }
    }
}

extension ExerciseView {
    static let mockSections = [
        Section(name: "Aufwärmen", playlist: "Playlist 2", info: "10x Sätze"),
        Section(name: "Brust", playlist: "Playlist 2", info: "8x Sätze"),
        Section(name: "Biceps", playlist: "Playlist 2", info: "5x Sätze"),
        Section(name: "Triceps", playlist: "Playlist 2", info: "5x Sätze"),
    ]
    
    static let mockExercises = [
        Exercise(name: "Push Day", sections: mockSections),
        Exercise(name: "Pull Day", sections: mockSections),
        Exercise(name: "Leg Day", sections: mockSections),
        Exercise(name: "Cardio :/", sections: mockSections)
    ]
}

struct TrainingView: View {
    
    //let exercise: Exercise
    @Binding var exercise: Exercise
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(exercise.sections) { section in
                    
                    NavigationLink(destination: SectionView(section: .constant(exercise.sections.first(where: { $0.id == section.id })!))) {
                        Text(section.name)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColor.background)
                            .cornerRadius(6)
                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                    }
                }
                
                Spacer()
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(AppColor.backgroundV2)
            }
            .padding()
        }.navigationBarTitle(exercise.name)
    }
}

struct SectionView: View {
    
    @Binding var section: Section
    
    var body: some View {
            VStack {
                Spacer(minLength: 3)
                
                Text("Playlist: \(section.playlist)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColor.background)
                    .cornerRadius(6)
                    .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                
                Text("Extra Info: \(section.info)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColor.background)
                    .cornerRadius(6)
                    .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)
                
                Spacer()
            }.navigationBarTitle(section.name)
            .padding()
            
    }
}

#if DEBUG
struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
#endif
