//
//  ChartBar.swift
//  skripsi
//
//  Created by Rival Fauzi on 03/01/24.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: geometry.size.width, height: 15)
                    .foregroundColor(Color(.systemGray6))
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(Color(.systemBlue))
                    .animation(.easeIn(duration: 1.0), value: 1)
            }
        }
    }
}
