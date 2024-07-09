//
//  AudioRecordToolbarView.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct AudioRecordToolbarView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 140)
                .foregroundStyle(.mint)
            Image(systemName: "mic.fill")
                .resizable()
                .frame(width: 30, height: 45)
                .foregroundStyle(.white)
        }
        
    }
}

#Preview {
    AudioRecordToolbarView()
}
