//
//  ViewTemplate.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct Toolbar: View {
    var body: some View {
        NavigationStack {
            Text("content") //content goes here idk how :p
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: {}, label: {
                                Image(systemName: "checklist")
                                    .foregroundStyle(.mint)
                            })
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "camera")
                                    .foregroundStyle(.mint)
                            })
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "mic.fill")
                                    .foregroundStyle(.mint)
                            })
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "bubble")
                                    .foregroundStyle(.mint)
                            })
                        }
                        .background(
                            Rectangle()
                                .frame(width: 400, height: 1)
                                .foregroundColor(.gray)
                                .opacity(0.3)
                                .offset(y: -10),
                            alignment: .top
                        )
                    }
                }
        }
    }
}

#Preview {
    Toolbar()
}
