//
//  ViewTemplate.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct Toolbar: View {
//    @State public var toggledView: String
    
    var body: some View {
        NavigationStack {
            EmptyView()
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
//        if toggledView == "checklist" {
//            EmptyView()
//        } else if toggledView == "camera" {
//            EmptyView()
//        } else if toggledView == "mic" {
//            AudioRecordToolbarView()
//        } else if toggledView == "bubble" {
//            EmptyView()
//        }
    }
}

//#Preview {
//    Toolbar(toggledView: <#String#>)
//}
