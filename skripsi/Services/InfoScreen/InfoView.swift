//
//  InfoView.swift
//  skripsi
//
//  Created by Rival Fauzi on 02/01/24.
//

import SwiftUI

struct InfoView: View {
    var arrayAksara: InfoModel?
    var viewModel: InfoViewModel = InfoViewModel()
    
    init(section: Int) {
        let jsonData2 = readLocalJSONFile(forName: "NewInfoAksara")
        
        if let data = jsonData2 {
            if let record = infoDataParse(jsonData: data) {
                self.arrayAksara = record.filter{ $0.section == section }.first
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                HStack {
                    Text(arrayAksara?.title ?? "")
                        .font(.title2)
                    Spacer()
//                    Image(systemName: "heart.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: geometry.size.width * 0.05)
//                        .foregroundColor(.red)
//                    Text("5")
//                        .foregroundColor(.red)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text(arrayAksara?.description ?? "")
                            .lineSpacing(8)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if arrayAksara?.description2 != "" {
                            Text(arrayAksara?.description2 ?? "")
                                .lineSpacing(8)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if arrayAksara?.note != "" {
                            Text(arrayAksara?.note ?? "")
                                .lineSpacing(8)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if arrayAksara?.note2 != "" {
                            Text(arrayAksara?.note2 ?? "")
                                .lineSpacing(8)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        ForEach(arrayAksara?.text ?? [], id: \.self) { char in
                            InfoSectionCards(section: arrayAksara?.section ?? 0, char: char)
                        }
                    }
                }

                NavigationLink(destination: MainTestView(aksara: arrayAksara!.text.map{ $0.characterString })) {
                    Text("Mulai Belajar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.customBlue)
                                .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 2)
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    InfoView(section: 1)
}
