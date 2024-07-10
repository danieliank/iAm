//
//  JournalView.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct JournalView: View {
    @State private var toggledView: String?
    @State private var isRecorderToggled: Bool = false
    @State private var micIcon: String = "mic"
    
    var body: some View {
        NavigationStack {
            Text("") //to be replaced by the Journal Content
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.left").fontWeight(.medium)
                            Text("Notes")
                        })
                        .foregroundStyle(.mint)
                    }
                    ToolbarItem (placement: .principal) {
                        Text("MON 8 · 11.53").fontWeight(.medium)
                    }
                    ToolbarItem (placement: .topBarTrailing) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "ellipsis.circle").fontWeight(.medium)
                        })
                        .foregroundStyle(.mint)
                    }
                    
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
                            Button(action: {
                                self.toggledView = "mic"
                                withAnimation {
                                    isRecorderToggled.toggle()
                                }
                                micIcon = isRecorderToggled ? "mic.fill" : "mic"
                            }, label: {
                                Image(systemName: micIcon)
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
        if isRecorderToggled == true {
                AudioRecordToolbarView()
        } else {
            EmptyView()
        }
    }
}

#Preview {
    JournalView()
}
