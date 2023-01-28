//
//  StartDetailView.swift
//  MuscleMusic
//
//  Created by Ing. Ebu Celik, BSc on 28.01.23.
//

import SwiftUI

struct StartDetailView: View {
    var exercise: Exercise

    @State var play: Bool = false

    var body: some View {
        TabView {
            ForEach(exercise.sections, id: \.id) { section in
                HStack {
                    VStack {
                        Text("\(section.name)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColor.background)
                            .cornerRadius(6)
                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)

                        Text("\(section.playlist)")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColor.background)
                            .cornerRadius(6)
                            .shadow(color: .gray.opacity(0.4), radius: 2, x: 3, y: 3)

                        Spacer()
                            .frame(height: 50)

                        HStack {
                            Image(systemName: "backward.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(AppColor.backgroundV2)

                            Spacer()

                            if play {
                                Image(systemName: "pause.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(AppColor.backgroundV2)
                                    .onTapGesture {
                                        play.toggle()
                                    }
                            } else {
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(AppColor.backgroundV2)
                                    .onTapGesture {
                                        play.toggle()
                                    }
                            }

                            Spacer()

                            Image(systemName: "forward.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(AppColor.backgroundV2)
                        }
                        .padding()
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1)
                    )
                }
                .padding()
            }
        }
        .tabViewStyle(.page)
        .navigationBarTitle(Text(exercise.name))
    }
}
