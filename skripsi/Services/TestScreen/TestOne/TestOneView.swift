//
//  TestOneView.swift
//  skripsi
//
//  Created by Rival Fauzi on 02/01/24.
//

import SwiftUI

struct TestOneView: View {
    @Binding var isCheck: Bool
    var question: TestLevelOneModel
    let viewModel: TestOneViewModel = TestOneViewModel()
    @State var randomAnswer: [String] = []
    @Binding var choosenAnswer: String
    
    let exception = "NCRKFTWLDJYVMGBQZeiuh=\\"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 16) {
                Text("Aksara apa yang diperlihatkan?")
                    .font(.headline)
                
                VStack(spacing: 24) {
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            ZStack {
                                ZStack(alignment: .bottomTrailing) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color(.systemGray3))
                                    
                                    Image(systemName: "speaker.wave.2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 28)
                                        .padding(16)
                                }
                                
                                if exception.contains(question.characterString) {
                                    Image("\(question.characterString)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                        .foregroundColor(.black)
                                } else if question.characterString == "[o" {
                                    Image("\(question.characterString)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                        .foregroundColor(.black)
                                } else if question.characterString == "/" {
                                    Image("layar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                        .foregroundColor(.black)
                                } else {
                                    Text(question.characterString)
                                        .font(.custom("HanacarakaNormal", size: 64))
                                        .padding(.trailing, 16)
                                }
                            }
                            .foregroundColor(.black)
                        }
                        .frame(width: geometry.size.width * 0.4)
                        
                        Spacer()
                    }
                    .padding(.bottom, geometry.size.height * 0.08)
                    
                    ForEach(randomAnswer, id:\.self) { ans in
                        Button(action: {
                            choosenAnswer = ans
                            isCheck = false
                        }, label: {
                            HStack {
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color(.systemGray5))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(choosenAnswer == ans ? Color.customBlue : Color(.systemGray2), lineWidth: 3)
                                        )
                                    Text(ans.capitalized)
                                        .foregroundColor(choosenAnswer == ans ? .customBlue : .black)
                                }
                                Spacer()
                            }
                        })
                        .frame(height: geometry.size.height * 0.09)
                    }
                }
                .padding(.top, geometry.size.height * 0.08)
                
                Spacer()
            }
            .padding(.top, geometry.size.height * 0.02)
        }
        .onAppear {
            randomAnswer = viewModel.generateRandomAnswer(listAnswer: question.answer, answer: question.name)
        }
        .onChange(of: question) { newValue in
            randomAnswer = viewModel.generateRandomAnswer(listAnswer: newValue.answer, answer: newValue.name)
        }
    }
}

#Preview {
//    TestOneView()
    MainTestView(aksara: ["a","n","c","r","k"])
}
