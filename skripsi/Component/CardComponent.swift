//
//  CardComponent.swift
//  skripsi
//
//  Created by Rival Fauzi on 25/12/23.
//

import SwiftUI

struct TitleCardsMainView: View {
    var title: String
    var textBody: String
    var rectangleColor: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    
                }
                
                HStack {
                    Text(textBody)
                        .font(.body)
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .padding()

            Spacer()
        }
        .background {
            Rectangle()
                .fill(rectangleColor)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
        }
    }
}

struct SectionCardsMainView: View {
    var content: String
    var rectangleBackgroundColor = Color(.systemGray4)

    var body: some View {
        HStack(spacing: 16) {
            HStack {
                if content.count > 5 {
                    ForEach(Array(content), id: \.self) {char in
                        if char != " " {
                            if "HSP".contains(char) {
                                Text(String(char))
                                    .font(.custom("HanacarakaNormal", size: 26))
                                    .padding(.trailing)
                            } else {
                                Image("\(char)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 26)
                            }
                        }
                    }
                } else {
                    Text(content)
                        .font(.custom("HanacarakaNormal", size: 26))
                }
                
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 26)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(rectangleBackgroundColor)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
            }
        }
    }
}

extension SectionCardsMainView {
    func rectangleBackgroundColor(_ color: Color) -> Self {
        var view = self
        view.rectangleBackgroundColor = color
        return view
    }
}

struct SandhanganCardsMainView: View {
    var content: String
    var rectangleBackgroundColor = Color(.systemGray4)

    var body: some View {
        HStack(spacing: 16) {
            HStack {
                Text(content)
                    .font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 26)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(rectangleBackgroundColor)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
            }
        }
    }
}

extension SandhanganCardsMainView {
    func rectangleBackgroundColor(_ color: Color) -> Self {
        var view = self
        view.rectangleBackgroundColor = color
        return view
    }
}

struct InfoSectionCards: View {
    let section: Int
    let exception = "NCRKFTWLDJYVMGBQZeiuh=\\"
    let char: AksaraInfoModel
    
    var body: some View {
        HStack {
            Button(action: {
                playSound(name: char.name.capitalized)
            }, label: {
                ZStack {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.customBlue)
                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                        
                        Image(systemName: "speaker.wave.2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(.white)
                            .padding(8)
                    }
                    
                    if exception.contains(char.characterString) {
                        Image("\(char.characterString)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.white)
                    } else if char.characterString == "[o" {
                        Image("\(char.characterString)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.white)
                    } else if char.characterString == "/" {
                        Image("layar")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.white)
                    } else {
                        Text(char.characterString)
                            .font(.custom("HanacarakaNormal", size: char.characterString.count == 1 ? 45 : char.characterString.count == 2 ? 37 : 30))
                            .foregroundColor(.white)
                            .padding(.trailing, 8)
                    }
                }
                .frame(width: 100)
            })
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(char.name)
                        .bold()
                    if section > 4 && ((char.example?.isEmpty) != nil) {
                        VStack(spacing: 16) {
                            HStack {
                                Text("\(char.description) :")
                                Spacer()
                            }
                            HStack {
                                Text(char.example!)
                                    .font(.custom("HanacarakaNormal", size: 20))
                                Spacer()
                            }
                        }
                    } else {
                        Text("seperti dalam kata “\(Text(char.description).bold())”")
                    }
                }
                .padding()
//                .frame(maxWidth: .infinity)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SectionCardsMainView(content: "H    N    C    R     K")
//    TitleCardsMainView(title: "Carakan 1", textBody: "Belajar aksara jawa dasar yang memiliki vokal \"a\"") {
//        
//    }
//    InfoSectionCards(section: 1, aksara: "\\", name: "ha", description: "arek")
}

struct CircleProgress: View {
    let percentage: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color(.systemGray5).opacity(0.55),
                    lineWidth: 10)
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(
                    Color(.customBlue), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .animation(Animation.easeInOut(duration: 1.0))
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26)
                .foregroundColor(.customBlue)
        }
        .padding(.leading, 10)
        .frame(width: 50)
    }
}
