//
//  PopUp.swift
//  skripsi
//
//  Created by Rival Fauzi on 23/01/24.
//

import Foundation
import SwiftUI

struct PopUpFailed: View {
    @Binding var isFailed: Bool
    @Binding var choosenAnswer: String
    @Binding var isCheck: Bool
    
    @State var isMoved = false
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    VStack {
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "x.circle.fill")
                                Text("Salah")
                                    .font(.system(size: geometry.size.height * 0.04))
                                .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Coba lagi!!")
                                    .padding(.horizontal)
                                Spacer()
                            }
                            
                            Spacer()
                            Button {
                                withAnimation {
                                    isMoved = false
                                }
                                
                                choosenAnswer = ""
                                isCheck = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isFailed = false
                                }
                                
                            } label: {
                                Text("Mengerti")
                                    .font(.system(size: geometry.size.height * 0.025))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                                    }
                            }
                        }
                        .padding()
                        .foregroundColor(.red)
                        .frame(width: geometry.size.width, height: geometry.size.width * 0.5, alignment: .center)
                        .cornerRadius(20)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Color.white)
                                    .ignoresSafeArea()
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Color.red.opacity(0.2))
                                    .ignoresSafeArea()
                            }
                        )
                    }
                    .animation(Animation.easeIn(duration: 0.2), value: isMoved ? 1 : 0)
                    .onAppear{
                        isMoved = true
                    }
                    .offset(y: isMoved ? 0 : geometry.size.width * 0.5)
                }
            }
        }
    }
}

struct PopUpTrue: View {
    @Binding var isTrue: Bool
    @Binding var choosenAnswer: String
    @Binding var isCheck: Bool
    @Binding var questionIndex: Int
    @Binding var testDone: Bool
    
    @State var isMoved = false
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    VStack {
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Bagus")
                                    .font(.system(size: geometry.size.height * 0.04))
                                .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Selamat kamu berhasil")
                                    .padding(.horizontal)
                                Spacer()
                            }
                            
                            Spacer()
                            Button {
                                withAnimation {
                                    isMoved = false
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isTrue = false
                                    choosenAnswer = ""
                                    isCheck = true
                                    
                                    if questionIndex + 1 < 7 {
                                        questionIndex = questionIndex + 1
                                    } else {
                                        testDone = true
                                    }
                                }
                            } label: {
                                Text("Selanjutnya")
                                    .font(.system(size: geometry.size.height * 0.025))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                                    }
                            }
                        }
                        .padding()
                        .foregroundColor(.green)
                        .frame(width: geometry.size.width, height: geometry.size.width * 0.5, alignment: .center)
                        .cornerRadius(20)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Color.white)
                                    .ignoresSafeArea()
                                RoundedRectangle(cornerRadius: 12.0)
                                    .fill(Color.green.opacity(0.2))
                                    .ignoresSafeArea()
                            }
                        )
                    }
                    .animation(Animation.easeIn(duration: 0.2), value: isMoved ? 1 : 0)
                    .onAppear{
                        isMoved = true
                    }
                    .offset(y: isMoved ? 0 : geometry.size.width * 0.5)
                }
            }
        }
    }
}

struct AlertView : View{
    @Binding var backButton: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("Apakah kamu yakin meninggalkan progress?")
                            .font(.system(size: geometry.size.height * 0.03))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        HStack {
                            Button {
                                backButton = false
                            } label: {
                                Text("Kembali")
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.primary)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.regularMaterial)
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Ya")
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.red)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.regularMaterial)
                        }
                    }
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.5, alignment: .center)
                    .cornerRadius(20)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 12.0)
                                .fill(Color.white)
                                .ignoresSafeArea()
                        }
                    )
                }
            }
        }
    }
}

#Preview {
//    MainTestView(aksara: "ancrk")
    AlertView(backButton: .constant(true))
}
