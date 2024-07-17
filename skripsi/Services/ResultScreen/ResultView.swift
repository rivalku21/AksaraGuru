//
//  ResultView.swift
//  skripsi
//
//  Created by Rival Fauzi on 23/01/24.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var firstAppeared = false
    
    let imageNames = ["Image3", "Image5", "Image7", "Image9", "Image12","Image13", "Image14"]
    @State private var selectedImage: String?
    
    @Binding var timerMode: TimerMode
    @Binding var timeElapsed: TimeInterval
    let totalQuestion: Int
    let percentage: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Image("\(selectedImage ?? "Image1")")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Text("Lakukan banyak latihan untuk mencapai hasil terbaik")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading) {
                    Text("Catatan")
                        .font(.title3)
                    
                    HStack {
                        Image(systemName: "timer")
                        Text("Waktu")
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("\(timeElapsed.formattedSeconds())")
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "book.circle")
                        Text("Aktivitas")
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(totalQuestion) Aktivitas")
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "percent")
                        Text("Keberhasilan")
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(percentage)%")
                        
                        Spacer()
                    }
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.customBlue)
                        .opacity(0.2)
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Selanjutnya")
                        .font(.system(size: geometry.size.height * 0.025))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.customBlue)
                                .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                        }
                })
            }
        }
        .padding()
        .onAppear {
            selectedImage = imageNames.randomElement()
            timerMode = .stopped
        }
    }
}

//#Preview {
//    ResultView()
//}
