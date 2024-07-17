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
    @ObservedObject var viewModel: MainTestViewModel = MainTestViewModel()
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
    @State var percentage: Double = 0.0
    
    var stopWatch = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            if testDone {
                withAnimation {
                    ResultView(
                        timerMode: $timerMode,
                        timeElapsed: $timeElapsed,
                        totalQuestion: questions.count,
                        percentage: Int(percentage)
                    )
                }
            } else {
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        Button(action: {
                            if questionIndex == 0 {
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                backButton = true
                                viewModel.stopCountdown()
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

                        ProgressBar(value: CGFloat(viewModel.timeRemaining) / CGFloat(viewModel.maxTime))
                            .frame(height: 16)
                    }
                    if questions.isEmpty {
                        Text("loading")
                    } else {
                        switch questions[questionIndex].level {
                        case 1:
                            TestOneView(isCheck: $isCheck, question: questions[questionIndex], choosenAnswer: $choosenAnswer)
                        case 2:
                            TestTwoView(mainTestViewModel: viewModel, isCheck: $isCheck, choosenAnswer: $choosenAnswer, question: questions[questionIndex])
                        case 3:
                            TestThreeView(choosenAnswer: $choosenAnswer, isCheck: $isCheck, isFailed: $isFailed, question: questions[questionIndex])
                        default:
                            EmptyView()
                        }
                        
                        if questions[questionIndex].level == 3 {
                            Button(action: {
                                if choosenAnswer == questions[questionIndex].name {
                                    isChoosenTrue = true
                                    viewModel.stopCountdown()
                                } else {
                                    questions.append(questions[questionIndex])
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
                        } 
//                        else {
//                            Button(action: {
//                                progress = Float(questionIndex + 1) / Float(questions.count)
//                                isCheck = true
//                                
//                                if questionIndex + 1 < questions.count {
//                                    questionIndex = questionIndex + 1
//                                } else {
//                                    testDone = true
//                                }
//                            }, label: {
//                                Text("Selanjutnya")
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background {
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .fill(isCheck ? Color(.systemGray2) : .customBlue)
//                                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
//                                    }
//                            })
//                            .disabled(isCheck)
//                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            questions = viewModel.generateQuestion(aksara: aksara)
            timerMode = .running
            
            switch questions[questionIndex].level {
            case 1:
                viewModel.startCountdown(time: 5)
            case 2:
                viewModel.startCountdown(time: 10)
            case 3:
                viewModel.startCountdown(time: 20)
            default:
                viewModel.startCountdown(time: 5)
            }
        }
        .onChange(of: questionIndex, perform: { _ in
            switch questions[questionIndex].level {
            case 1:
                viewModel.startCountdown(time: 5)
            case 2:
                viewModel.startCountdown(time: 10)
            case 3:
                viewModel.startCountdown(time: 20)
            default:
                viewModel.startCountdown(time: 5)
            }
        })
        .onChange(of: isCheck) { newValue in
            if !newValue && questions[questionIndex].level != 3 {
                viewModel.stopCountdown()
                
                if questions[questionIndex].level != 2 {
                    if choosenAnswer == questions[questionIndex].name {
                        isChoosenTrue = true
                    } else {
                        questions.append(questions[questionIndex])
                        isFailed = true
                    }
                } else {
                    progress = Float(questionIndex + 1) / Float(questions.count)
                    isCheck = true
                    
                    if questionIndex + 1 < questions.count {
                        questionIndex = questionIndex + 1
                    } else {
                        percentage = Double(7) / Double(questions.count) * 100
                        testDone = true
                    }
                }
            }
        }
        .overlay {
            if isFailed {
                PopUpFailed(isFailed: $isFailed, choosenAnswer: $choosenAnswer, isCheck: $isCheck, questionIndex: $questionIndex, questionCount: questions.count)
            } else if isChoosenTrue {
                PopUpTrue(isTrue: $isChoosenTrue, choosenAnswer: $choosenAnswer, isCheck: $isCheck, questionIndex: $questionIndex, testDone: $testDone, percentage: $percentage, questionCount: questions.count)
                    .onAppear {
                        progress = Float(questionIndex + 1) / Float(questions.count)
                    }
            } else if backButton {
                AlertView(backButton: $backButton)
            }
        }
        .onReceive(viewModel.$timeUp, perform: { value in
            if value && !questions.isEmpty {
                questions.append(questions[questionIndex])
                isFailed = true
            }
        })
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
