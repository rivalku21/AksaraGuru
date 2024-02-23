//
//  Dashboard.swift
//  skripsi
//
//  Created by Rival Fauzi on 23/01/24.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 16) {
                    HStack(alignment: .center) {
                        Text("Aksara jawa")
                            .font(.title)
                        Spacer()
//                        Image(systemName: "heart.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: geometry.size.width * 0.05)
//                            .foregroundColor(.red)
//                        Text("5")
//                            .foregroundColor(.red)
                        
                    }
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            TitleCardsMainView(title: "Carakan 1", textBody: "Belajar aksara jawa dasar yang memiliki vokal \"a\"", rectangleColor: Color.customBlue)
                            VStack {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(.systemGray5).opacity(0.55),
                                                lineWidth: 10)
                                        Circle()
                                            .trim(from: 0, to: 0.4)
                                            .stroke(
                                                Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .rotationEffect(Angle(degrees: -90))
                                            .animation(Animation.easeInOut(duration: 1.0))
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "1.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
                                                .foregroundColor(.customBlue)
                                        })
                                    }
                                    .frame(width: 70)
                                    .padding(.horizontal)
                                    
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(.systemGray5).opacity(0.55),
                                                lineWidth: 10)
                                        Circle()
                                            .trim(from: 0, to: 0.4)
                                            .stroke(
                                                Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .rotationEffect(Angle(degrees: -90))
                                            .animation(Animation.easeInOut(duration: 1.0))
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "2.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
                                                .foregroundColor(.customBlue)
                                        })
                                    }
                                    .frame(width: 70)
                                    .padding(.horizontal)
                                    
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(.systemGray5).opacity(0.55),
                                                lineWidth: 10)
                                        Circle()
                                            .trim(from: 0, to: 0.4)
                                            .stroke(
                                                Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .rotationEffect(Angle(degrees: -90))
                                            .animation(Animation.easeInOut(duration: 1.0))
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "3.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
                                                .foregroundColor(.customBlue)
                                        })
                                    }
                                    .frame(width: 70)
                                    .padding(.horizontal)
                                }
                                .padding(.bottom)
                                
                                HStack {
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(.systemGray5).opacity(0.55),
                                                lineWidth: 10)
                                        Circle()
                                            .trim(from: 0, to: 0.4)
                                            .stroke(
                                                Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .rotationEffect(Angle(degrees: -90))
                                            .animation(Animation.easeInOut(duration: 1.0))
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "4.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
                                                .foregroundColor(.customBlue)
                                        })
                                    }
                                    .frame(width: 70)
                                    .padding(.horizontal)
                                    
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(.systemGray5).opacity(0.55),
                                                lineWidth: 10)
                                        Circle()
                                            .trim(from: 0, to: 0.4)
                                            .stroke(
                                                Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .rotationEffect(Angle(degrees: -90))
                                            .animation(Animation.easeInOut(duration: 1.0))
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "5.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
                                                .foregroundColor(.customBlue)
                                        })
                                    }
                                    .frame(width: 70)
                                    .padding(.horizontal)
                                }
                                .padding(.bottom)
                            }
                            
                            TitleCardsMainView(title: "Sandhangan", textBody: "Belajar tanda diakritik yang dipakai sebagai pengubah bunyi.", rectangleColor: Color(.systemGray3))
                            
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.2)
                                NavigationLink(destination: InfoView(section: 5)) {
                                    SandhanganCardsMainView(content: "Sandhangan Swara")
                                }
                            }
                            
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.2)
                                NavigationLink(destination: InfoView(section: 6)) {
                                    SandhanganCardsMainView(content: "Sandhangan Panyigeg")
                                }
                            }
                            
                            TitleCardsMainView(title: "Carakan II Aksara Pasangan", textBody: "Aksara penghubung suku kata tertutup konsonan dengan suku kata berikutnya", rectangleColor: Color(.systemGray3))
                            
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.7)
                                NavigationLink(destination: InfoView(section: 7)) {
                                    SectionCardsMainView(content: "H N C R K")
                                }
                            }
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.5)
                                NavigationLink(destination: InfoView(section: 8)) {
                                    SectionCardsMainView(content: "F T S W L")
                                }
                            }
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.1)
                                NavigationLink(destination: InfoView(section: 9)) {
                                    SectionCardsMainView(content: "P D J Y V")
                                }
                            }
                            HStack(spacing: 16) {
                                CircleProgress(percentage: 0.2)
                                NavigationLink(destination: InfoView(section: 10)) {
                                    SectionCardsMainView(content: "M G B Q Z")
                                }
                            }
                            
//                            TitleCardsMainView(title: "Aksara Murda dan Pasangannya", textBody: "Aksara pengganti nama", rectangleColor: Color(.systemGray3))
//
//                            HStack(spacing: 16) {
//                                CircleProgress(percentage: 0.7)
//                                NavigationLink(destination: InfoView(aksara: "ancrk", title: "Aksara Murda")) {
//                                    SectionCardsMainView(content: "ancrk")
//                                }
//                            }
//                            HStack(spacing: 16) {
//                                CircleProgress(percentage: 0.5)
//                                NavigationLink(destination: InfoView(aksara: "ftswl", title: "Aksara Murda Pasangan")) {
//                                    SectionCardsMainView(content: "ftswl")
//                                }
//                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    Dashboard()
}
