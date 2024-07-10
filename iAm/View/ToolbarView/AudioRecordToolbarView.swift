//
//  AudioRecordToolbarView.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct AudioRecordToolbarView: View {
    @State private var pulsate:Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.mint)
                .frame(width: 140)
                .foregroundStyle(.mint)
                .scaleEffect(pulsate ? 1.4 : 1)
                .opacity(pulsate ? 0 : 1)
                .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: false).speed(1))
            Circle()
                .stroke(.mint)
                .frame(width: 140)
                .foregroundStyle(.mint)
                .scaleEffect(pulsate ? 1.5 : 1)
                .opacity(pulsate ? 0 : 1)
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: false).speed(1))
            Circle()
                .frame(width: 140)
                .foregroundStyle(.mint)
            Image(systemName: "mic.fill")
                .resizable()
                .frame(width: 25, height: 40)
                .foregroundStyle(.white)
        }
        .onAppear() {
            self.pulsate.toggle()
        }
        .onTapGesture {
            print("start recording")
        }
        .padding(.vertical, 40)
    }
}

#Preview {
    AudioRecordToolbarView()
}
