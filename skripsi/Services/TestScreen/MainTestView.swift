//
//  MainTestView.swift
//  skripsi
//
//  Created by Rival Fauzi on 03/01/24.
//

import SwiftUI

struct MainTestView: View {
    @Environment(\.presentationMode) var presentationMode
    let aksara: [String]
    @State var progress: Float = 0.07
    @StateObject var viewModel: MainTestViewModel = MainTestViewModel()
    @State var questions: [TestLevelOneModel] = []
    @State var isCheck = true
    @State var questionIndex = 0
    @State var isFailed = false
    @State var isChoosenTrue = false
    @State var choosenAnswer = ""
    @State var testDone = false
    @State var backButton = false
    @State var timerMode: TimerMode = .stopped
    @State var timeElapsed: TimeInterval = 0.0
    
    var stopWatch = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            if testDone {
                withAnimation {
                    ResultView(timerMode: $timerMode, timeElapsed: $timeElapsed)
                }
            } else {
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        Button(action: {
                            if questionIndex == 0 {
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                backButton = true
                            }
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 48)
                                    .foregroundColor(.white)
                                Image(systemName: "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24)
                                    .foregroundColor(Color(.systemGray2))
                            }
                        })
                        
                        ProgressBar(progress: $progress)
                            .frame(height: geometry.size.height * 0.02)
                    }
                    if questions.isEmpty {
                        Text("loading")
                    } else {
                        switch questions[questionIndex].level {
                        case 1:
                            TestOneView(isCheck: $isCheck, question: questions[questionIndex], choosenAnswer: $choosenAnswer)
                        case 2:
                            TestTwoView(isCheck: $isCheck, choosenAnswer: $choosenAnswer, question: questions[questionIndex])
                        case 3:
                            TestThreeView(choosenAnswer: $choosenAnswer, isCheck: $isCheck, isFailed: $isFailed, question: questions[questionIndex])
                        default:
                            EmptyView()
                        }
                        
                        if questions[questionIndex].level != 2 {
                            Button(action: {
                                if choosenAnswer == questions[questionIndex].name {
                                    isChoosenTrue = true
                                } else {
                                    isFailed = true
                                }
                            }, label: {
                                Text("Periksa")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(isCheck ? Color(.systemGray2) : .customBlue)
                                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                                    }
                            })
                            .disabled(isCheck)
                        } else {
                            Button(action: {
                                progress = Float(questionIndex + 1) / Float(questions.count)
                                isCheck = true
                                
                                if questionIndex + 1 < 7 {
                                    questionIndex = questionIndex + 1
                                } else {
                                    testDone = true
                                }
                            }, label: {
                                Text("Selanjutnya")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(isCheck ? Color(.systemGray2) : .customBlue)
                                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                                    }
                            })
                            .disabled(isCheck)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            questions = viewModel.generateQuestion(aksara: aksara)
            timerMode = .running
        }
        .overlay {
            if isFailed {
                PopUpFailed(isFailed: $isFailed, choosenAnswer: $choosenAnswer, isCheck: $isCheck)
            } else if isChoosenTrue {
                PopUpTrue(isTrue: $isChoosenTrue, choosenAnswer: $choosenAnswer, isCheck: $isCheck, questionIndex: $questionIndex, testDone: $testDone)
                    .onAppear {
                        progress = Float(questionIndex + 1) / Float(questions.count)
                    }
            } else if backButton {
                AlertView(backButton: $backButton)
            }
        }
        .onReceive(stopWatch) { _ in
            updateTime()
        }
    }
    
    func updateTime() {
        if timerMode == .running {
            timeElapsed += 1
        }
    }
}

#Preview {
    MainTestView(aksara: ["a","n","c","r","k"])
}
