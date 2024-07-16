//
//  RecordingBarView.swift
//  iAm
//
//  Created by Raphael on 11/07/24.
//

import SwiftUI

struct RecordingBarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke()
                .frame(width: 353, height: 95)
                .foregroundStyle(.mint)
            VStack {
                Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 30, height: 35)
                                .foregroundStyle(.mint)

            }
            
        }
        
    }
}

#Preview {
    RecordingBarView()
}
